# ![](/assets/bu-bg.jpg)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/tj-cahill/Multitask-Research) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](/LICENSE) [![Twitter Follow](https://img.shields.io/twitter/follow/bucomresearch?lang=en?style=social)](https://twitter.com/intent/follow?screen_name=bucomresearch)

# BU CRC Multitasking Measurement Software

## Overview
This software package has been developed for the [Communication Research Center](https://sites.bu.edu/crc/) at Boston University, and consists of two psychometric tests. These tests can be administered through a web interface and measure aspects of **multitasking perfomance**, including speed, accuracy, and task switching cost. The project is intended to recreate the tasks from this interactive demonstration developed by the [New York Times](https://archive.nytimes.com/www.nytimes.com/interactive/2010/06/07/technology/20100607-task-switching-demo.html). Given that many modern web browsers no longer support Flash, the project is written in Dart using [Flutter](https://flutter.io).

## Setup
### Environment
* Fork the repository and clone it to your local machine
* Follow the instructions [here](https://flutter.io/docs/get-started/install) to install the Flutter SDK
* Follow the instructions [here](https://firebase.google.com/docs/cli#install_the_firebase_cli) to install required Firebase tools
* Setup [Android Studio](https://flutter.io/docs/development/tools/android-studio) or [Visual Studio Code](https://flutter.io/docs/development/tools/vs-code)

### Testing
To run a version of the package for local testing, run the following command from the project root:
```
flutter run -d chrome
```

Flutter supports hot and cold restarts after changes to the project, with the following commands:
* Cold restart: `r`
* Hot restart: `shift + r`

### Deployment
You can build the project for web as follows:
```
flutter build web
```
The app can be deployed to [Firebase](https://firebase.google.com/docs/hosting/test-preview-deploy#deploy-live) for hosting and data storage.

Once deployed, the test and export interfaces can be accessed from the following routes relative to the Firebase project URL:
| Route | Description |
| :----- | :------ |
| /#/multitask | Task Switching Test |
| /#/testfocus | Focus Test |
| /#/export | Data Export |

## Data Export
The results of both tests are stored in [Firestore](https://firebase.google.com/docs/firestore). Whenever a test is completed, the most recent study data in the project database is also automatically exported to a CSV file [stored](https://firebase.google.com/docs/storage) in the `/reports/` folder of the Firebase project. (**Note: Automatic exports can be resource intensive with large samples. If you expect to run tests frequently, it may be more economical to disable the automatic export functions and use legacy manual reporting functions.**)

<!-- 
### Legacy Export
* From the Google Cloud Functions panel, select the `autoReport_multitask` and `autoReport_testfocus` functions and remove their triggers
* Manually trigger the `csvJsonExport` script by going to the `/#/export` route in a browser 

-->
## Credits
This project is led by Dr. James Cummings, Division of Emerging Media Studies, Boston University. The package was initially developed by [Beck](https://maoyizhou.com) and this fork was modified by [Tiernan Cahill](https://tiernancahill.com).

## License
This project is released under the MIT License.

MIT © [Communication Research Center](http://sites.bu.edu/crc/)
