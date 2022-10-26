import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'square_data.dart';
import 'instruction_content.dart';
import 'square.dart';

class SquareAnimation extends StatefulWidget {
  int currentLevel;
  final int totalLevel;
  final Function nextLevel;
  final List<List<M>> before;
  final List<List<M>> after;
  final int numberOfBlueRectangles;
  final String title;
  final Function submitReport;
  final Function navigateToNextPage;

  SquareAnimation({
    Key key,
    @required this.currentLevel,
    @required this.totalLevel,
    @required this.nextLevel,
    @required this.before,
    @required this.after,
    @required this.numberOfBlueRectangles,
    @required this.submitReport,
    @required this.navigateToNextPage,
    @required this.title,
  }) : super(key: key);

  @override
  _SquareAnimationState createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation> {
  Timer timer1, timer2, timer3, timer4, timer5;
  Stopwatch stopwatch;
  bool isBefore = false, isAfter = false, isDone = false;
  List exportData = [];

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    timer1?.cancel();
    timer2?.cancel();
    timer3?.cancel();
    timer4?.cancel();
    timer5?.cancel();
    stopwatch?.stop();
    super.dispose();
  }

  void start() {
    setState(() {
      isBefore = false;
      isAfter = false;
      isDone = false;
    });
    timer1 = new Timer(Duration(milliseconds: 0), () {
      setState(() {
        isBefore = false;
        isAfter = false;
      });
      timer2 = new Timer(const Duration(milliseconds: 200), () {
        setState(() {
          isBefore = true;
          isAfter = false;
        });
        timer3 = new Timer(Duration(milliseconds: 100), () {
          setState(() {
            isBefore = false;
            isAfter = false;
          });
          timer4 = new Timer(Duration(milliseconds: 900), () {
            setState(() {
              isBefore = false;
              isAfter = true;
            });
            timer5 = new Timer(Duration(milliseconds: 2000), () {
              setState(() {
                isBefore = false;
                isAfter = false;
                isDone = true;
              });
              stopwatch = new Stopwatch();
              stopwatch.start();
            });
          });
        });
      });
    });
  }

  Widget create() {
    if (isBefore && !isAfter) {
      return Square().gridGenerator(data: widget.before);
    }

    if (!isBefore && isAfter) {
      return Square().gridGenerator(data: widget.after);
    }

    if (isDone) {
      return InstructionContent(
        levelsLeft: widget.totalLevel - widget.currentLevel,
        isPracticeEnd: widget.totalLevel == widget.currentLevel &&
            widget.title == 'Practice Test',
        isTestEnd:
            widget.totalLevel == widget.currentLevel && widget.title == 'Test',
        buttonClick: (isYes) {
          bool isAnyRedTargetRotated =
              testFocusData[widget.currentLevel - 1]['isAnyRedTargetRotated'];
          exportData.add({
            "isAnyRedTargetRotated": isAnyRedTargetRotated,
            "userChoice": isYes,
            "timeCost": stopwatch.elapsedMilliseconds,
            "numberOfBlueRectangles": widget.numberOfBlueRectangles
          });
          // print(exportData);

          if (widget.totalLevel == widget.currentLevel) {
            widget.navigateToNextPage(exportData);
            widget.submitReport(exportData);
            return;
          }

          start();
          widget.currentLevel++;
          widget.nextLevel(widget.currentLevel);
        },
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Color.fromRGBO(226, 226, 226, 1),
          width: 5,
          height: 64,
        ),
        Container(
          color: Color.fromRGBO(226, 226, 226, 1),
          width: 64,
          height: 5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: create(),
      height: 600,
    );
  }
}
