const functions = require('firebase-functions');
const admin = require('firebase-admin');
const fs = require('fs-extra');
const path = require('path');
const os = require('os');
const { Storage } = require('@google-cloud/storage');
const { buildMultitaskHeader, buildMultitaskData } = require('./helper_multitask');
const { buildFocusHeader, buildFocusData } = require('./helper_testfocus');
admin.initializeApp(functions.config().firebase);

exports.csvJsonReport_multitask = functions.https.onRequest((request, response) => {
    response.set('Access-Control-Allow-Origin', '*');
    const db = admin.firestore()
    const bucketName = 'common-research.appspot.com';
    const fileName = `reports/report_multitask.csv`;
    const tempFilePath = path.join(os.tmpdir(), fileName);

    const storage = new Storage();
    const myBucket = storage.bucket(bucketName);

    db.collection('multitask')
        .get()
        .then(querySnapshot => {
            const dataList = []
            querySnapshot.forEach(doc => {
                dataList.push(doc.data())
            });
            const header = buildMultitaskHeader();
            const dataRow = buildMultitaskData(dataList);
            return header.concat(dataRow);
        }).then(csv => {
            return fs.outputFile(tempFilePath, csv);
        }).then(() => {
            return myBucket.upload(tempFilePath, { destination: fileName })
        }).then(() => {
            response.redirect('https://console.firebase.google.com/');
        }).catch(err => console.log(err))
});

exports.csvJsonReport_testfocus = functions.https.onRequest((request, response) => {
    response.set('Access-Control-Allow-Origin', '*');
    const db = admin.firestore();
    const bucketName = 'common-research.appspot.com';
    const fileName = 'reports/report_testfocus.csv';
    const tempFilePath = path.join(os.tmpdir(), fileName);

    const storage = new Storage();
    const myBucket = storage.bucket(bucketName);

    db.collection('testfocus')
        .get()
        .then(querySnapshot => {
            const dataList = []
            querySnapshot.forEach(doc => {
                dataList.push(doc.data())
            });
            const header = buildFocusHeader(); // Modify this with new helper methods
            const dataRow = buildFocusData(dataList); // And this
            return header.concat(dataRow);
        }).then(csv => {
            return fs.outputFile(tempFilePath, csv);

        }).then(() => {
            return myBucket.upload(tempFilePath, { destination: fileName })
        }).then(() => {
            response.redirect('https://console.firebase.google.com/');
        }).catch(err => console.log(err))
});


// The function variations below are intended to automatically trigger and automatically
// re-export the user data each time a new record is created (which shouldn't happen more 
// than a couple hundred times in production).
exports.autoReport_multitask = functions.firestore.document('multitask/{doc}').onWrite((change, context) => {
    const db = admin.firestore()
    const bucketName = 'common-research.appspot.com';
    const fileName = `reports/report_multitask.csv`;
    const tempFilePath = path.join(os.tmpdir(), fileName);
    const exportFilePath = path.join("gs://", bucketName, '/', fileName);

    const storage = new Storage();
    const myBucket = storage.bucket(bucketName);

    db.collection('multitask')
        .get()
        .then(querySnapshot => {
            const dataList = []
            querySnapshot.forEach(doc => {
                dataList.push(doc.data())
            });
            const header = buildMultitaskHeader();
            const dataRow = buildMultitaskData(dataList);
            return header.concat(dataRow);
        }).then(csv => {
            return fs.outputFile(tempFilePath, csv);
        }).then(() => {
            return myBucket.upload(tempFilePath, { destination: fileName })
        }).catch(err => console.log(err))

    return exportFilePath;
});

exports.autoReport_testfocus = functions.firestore.document('testfocus/{doc}').onWrite((change, context) => {
    const db = admin.firestore();
    const bucketName = 'common-research.appspot.com';
    const fileName = 'reports/report_testfocus.csv';
    const tempFilePath = path.join(os.tmpdir(), fileName);
    const exportFilePath = path.join("gs://", bucketName, '/', fileName);

    const storage = new Storage();
    const myBucket = storage.bucket(bucketName);

    db.collection('testfocus')
        .get()
        .then(querySnapshot => {
            const dataList = []
            querySnapshot.forEach(doc => {
                dataList.push(doc.data())
            });
            const header = buildFocusHeader(); // Modify this with new helper methods
            const dataRow = buildFocusData(dataList); // And this
            return header.concat(dataRow);
        }).then(csv => {
            return fs.outputFile(tempFilePath, csv);

        }).then(() => {
            return myBucket.upload(tempFilePath, { destination: fileName })
        }).catch(err => console.log(err))

    return exportFilePath;
});
