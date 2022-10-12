import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:MultitaskResearch/FocusTest/SquareAnimation.dart';
import 'package:MultitaskResearch/FocusTest/SquareData.dart';
import 'package:MultitaskResearch/FocusTest/end.dart';
import 'package:MultitaskResearch/DebriefSite/debriefPage.dart';

class TestPage extends StatefulWidget {
  final String title;
  final String id;
  final List practiceTestRes;
  TestPage({
    Key key,
    @required this.title,
    @required this.id,
    this.practiceTestRes,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final fs.Firestore firestore = fb.firestore();
  double widthRatio, heightRatio;
  int currentLevel = 1;
  List data = [];

  void nextLevel(cur) {
    setState(() {
      currentLevel = cur;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.title == 'Test') {
      data = testFocusData;
    }

    if (widget.title == 'Practice Test') {
      data = testFocusPracticeData;
    }
  }

  void submitReport(List exportData) {
    if (widget.title == 'Test') {
      // send to server
      DateTime now = DateTime.now();
      Map<String, dynamic> mp = {
        "id": widget.id,
        "res": exportData,
        "practice_res": widget.practiceTestRes,
        "test_time": now.toIso8601String()
      };
      // print(mp);
      firestore
          .collection('testfocus')
          .add(mp)
          .then((value) => print(value))
          .catchError((onError) => print(onError));
    }
  }

  // Function that redirects to the subsequent phase (can be extended for
  // random sequencing if necessary).
  void nextPhase() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => DebriefPage(id: widget.id)));
  }

  void navigateToNextPage(exportData) {
    if (currentLevel == data.length && widget.title == 'Practice Test') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TestPage(
              title: "Test",
              id: widget.id,
              practiceTestRes: exportData,
            ),
          ));
    }

    if (currentLevel == data.length && widget.title == 'Test') {
      nextPhase();
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => End()));
    }
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 1024;
    heightRatio = MediaQuery.of(context).size.height / 768;
    return Scaffold(
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        alignment: AlignmentDirectional.center,
        width: 700,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 204, 204, 204)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 5),
                width: 658,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 204, 204, 204)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                      color: Color.fromARGB(255, 240, 244, 244),
                      child: Text(
                        widget.title != "Test"
                            ? widget.title + " $currentLevel of ${data.length}"
                            : '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    widget.title != "Test"
                        ? LinearProgressIndicator(
                            value: currentLevel / data.length,
                          )
                        : Container(),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height >= 1080
                                ? 105
                                : 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SquareAnimation(
                                currentLevel: currentLevel,
                                totalLevel: data.length,
                                nextLevel: nextLevel,
                                before: data[currentLevel - 1]['before'],
                                after: data[currentLevel - 1]['after'],
                                numberOfBlueRectangles: data[currentLevel - 1]
                                    ['numberOfBlueRectangles'],
                                submitReport: submitReport,
                                navigateToNextPage: navigateToNextPage,
                                title: widget.title,
                              ),
                            ])),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height >= 1080
                              ? 200
                              : 0),
                    )
                  ],
                )),
          ],
        ),
      )
    ]));
  }
}
