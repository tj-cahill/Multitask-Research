// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';
import 'package:flutter/material.dart';
import 'quality_prompt_form.dart';

class ViewportCheckPage extends StatefulWidget {
  final String id;
  ViewportCheckPage({Key key, @required this.id}) : super(key: key);

  @override
  _ViewportCheckState createState() => _ViewportCheckState();
}

class _ViewportCheckState extends State<ViewportCheckPage> {
  double widthRatio;
  double heightRatio;
  bool _viewportOK;

  void nextPhase() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => QAForm(id: widget.id)));
  }

  void goFullScreen() {
    document.documentElement.requestFullscreen();
  }

  Widget _showViewportAlert() {
    if (!_viewportOK)
      goFullScreen();
    else if (!_viewportOK) {
      return new Container(
        width: 300,
        margin: EdgeInsets.only(top: 275 * heightRatio),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent, width: 5)),
        child: Column(
          children: [
            Text('WARNING',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            Text(
                'To ensure that the test displays correctly, please maximize your browser window before proceeding.',
                style: TextStyle(fontSize: 15, color: Colors.red))
          ],
        ),
      );
    }

    return new Container();
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 1024;
    heightRatio = MediaQuery.of(context).size.height / 768;
    _viewportOK = MediaQuery.of(context).size.width >= 1024 &&
        MediaQuery.of(context).size.height >= 768;

    if (_viewportOK) {
      Future.delayed(Duration.zero, () {
        nextPhase();
      });
    }

    return new Scaffold(
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_showViewportAlert()])
    ]));
  }
}
