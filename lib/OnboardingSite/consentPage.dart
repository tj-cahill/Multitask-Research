import 'package:flutter/material.dart';
import 'package:MultitaskResearch/idRegex.dart';
import 'package:MultitaskResearch/OnboardingSite/viewportCheck.dart';

class ConsentPage extends StatefulWidget {
  final String id;
  ConsentPage({Key key, @required this.id}) : super(key: key);

  @override
  _ConsentPageState createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  void buttonClicked() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ViewportCheckPage(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Container consentBlock(String id) {
      // Two alternate versions of the consent text
      final Container sonaText = new Container(
          padding: EdgeInsets.only(left: 80, right: 80),
          width: width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  "In this study you will be asked to complete two series of attention-testing exercises. The study should take approximately 15 minutes and must be required in one uninterrupted session. In exchange for successfully completing this study, you will be offered a \$20 Amazon gift card.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Before you begin, please read through the participation requirements below. If you cannot meet these requirements at this time, please stop and return to this page later. Note: failure to follow these instructions will void your eligibility for any compensation for your participation.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '1) Location\n',
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "You will be required to give your full attention to the study exercises. Please make sure you are in a quiet location in which you will not be distracted and are not likely to experience any interruptions. Please turn off other devices and leave your phone in another room.",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38)))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '2) Computer\n',
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "This study must be completed on a desktop or laptop computer with a full keyboard. You are ",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38))),
                    TextSpan(
                        text: "not permitted",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38))),
                    TextSpan(
                        text:
                            " to complete this study using a phone, tablet, or other mobile device.",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38))),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '3) Full-Screen Mode\n',
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "Please view this window in full-screen mode. To do this:",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38)))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "• On Apple computers: click the small green icon at the top-left of the window",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "• On Windows computers: press the F11 button",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Additionally, if you did not fully complete the \"Media Usage Habits\" study on SONA, you are not eligible to complete or receive compensation for this study.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Your participation in this study is entirely voluntary and you may stop at any time. No discomfort is anticipated while participating in this study. Your responses will be reported anonymously and the confidentiality of your responses will be protected at all times when the results are reported. In order to participate, you must be at least 18 years of age.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "If you have any questions related to this research, please contact Dr. James Cummings at cummingj@bu.edu. If you have questions about your rights as a research participant, or if you have any complaints or concerns and want to speak with someone independent of the research team, you may contact the Boston University Charles River Campus IRB at 617-358-6115 or irb@bu.edu.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "If you (a) have completed the earlier \"Media Usage Habits\" study, (b) are in a quiet location, (c) are reading this page on a laptop or desktop computer, and (d) have set the study window to full-screen mode, you may now proceed to the attention-testing exercises. To do so, click the \"Next\" button below.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 80),
                      child: ButtonTheme(
                        minWidth: 300.0,
                        height: 55.0,
                        child: RaisedButton(
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: this.buttonClicked,
                          color: Color.fromRGBO(204, 0, 0, 1),
                          splashColor: Color.fromRGBO(204, 0, 0, 1),
                        ),
                      ),
                    ),
                  ])
            ],
          ));
      final Container qualtricsText = new Container(
          padding: EdgeInsets.only(left: 80, right: 80),
          width: width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  "In this study you will be asked to complete two series of attention-testing exercises. The study should take approximately 15 minutes and must be required in one uninterrupted session. In exchange for successfully completing this study, you will be offered a \$20 Amazon gift card.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Before you begin, please read through the participation requirements below. If you cannot meet these requirements at this time, please stop and return to this page later. Note: failure to follow these instructions will void your eligibility for any compensation for your participation.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '1) Location\n',
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "You will be required to give your full attention to the study exercises. Please make sure you are in a quiet location in which you will not be distracted and are not likely to experience any interruptions. Please turn off other devices and leave your phone in another room.",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38)))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '2) Computer\n',
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "This study must be completed on a desktop or laptop computer with a full keyboard. You are ",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38))),
                    TextSpan(
                        text: "not permitted",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38))),
                    TextSpan(
                        text:
                            " to complete this study using a phone, tablet, or other mobile device.",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38))),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '3) Full-Screen Mode\n',
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "Please view this window in full-screen mode. To do this:",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38)))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "• On Apple computers: click the small green icon at the top-left of the window",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "• On Windows computers: press the F11 button",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Additionally, if you did not fully complete the previous study on Qualtrics, you are not eligible to complete or receive compensation for this study.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Your participation in this study is entirely voluntary and you may stop at any time. No discomfort is anticipated while participating in this study. Your responses will be reported anonymously and the confidentiality of your responses will be protected at all times when the results are reported. In order to participate, you must be at least 18 years of age.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "If you have any questions related to this research, please contact Dr. James Cummings at cummingj@bu.edu. If you have questions about your rights as a research participant, or if you have any complaints or concerns and want to speak with someone independent of the research team, you may contact the Boston University Charles River Campus IRB at 617-358-6115 or irb@bu.edu.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "If you (a) have completed the earlier Qualtrics study, (b) are in a quiet location, (c) are reading this page on a laptop or desktop computer, and (d) have set the study window to full-screen mode, you may now proceed to the attention-testing exercises. To do so, click the \"Next\" button below.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 80),
                      child: ButtonTheme(
                        minWidth: 300.0,
                        height: 55.0,
                        child: RaisedButton(
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: this.buttonClicked,
                          color: Color.fromRGBO(204, 0, 0, 1),
                          splashColor: Color.fromRGBO(204, 0, 0, 1),
                        ),
                      ),
                    ),
                  ])
            ],
          ));

      if (IDRegex.sonaPattern.hasMatch(id)) {
        return sonaText;
      } else if (IDRegex.qualtricsPattern.hasMatch(id)) {
        return qualtricsText;
      }

      // Should only be reached if ID validation fails; maybe add an error message here?
      return new Container();
    }

    return Scaffold(
        body: ListView(
      children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                    color: Color.fromRGBO(204, 0, 0, 1),
                    height: 35,
                    width: double.infinity,
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: width * 0.1),
                          child: Text(
                            "Boston University",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                          ))
                    ])),
                Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Container(
                        height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[consentBlock(widget.id)])),
              ]),
              Padding(
                  padding: EdgeInsets.only(bottom: 180),
                  child: Container(
                      height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
            ])
      ],
    ));
  }
}
