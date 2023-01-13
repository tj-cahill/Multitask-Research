import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';
import '../id_regex.dart';
import 'viewport_check.dart';

class ConsentPage extends StatefulWidget {
  final String id;
  ConsentPage({Key key, @required this.id}) : super(key: key);

  @override
  _ConsentPageState createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  final fs.Firestore firestore = fb.firestore();

  Future<fs.DocumentReference> createRecord() async {
    // Create a participant record to show that the participant consents and has
    // proceeded to testing
    Map<String, dynamic> record = {
      "id": widget.id,
      "start_time": DateTime.now().toIso8601String(),
      "qa_passed": null
    };

    final fs.DocumentReference recordRef =
        firestore.collection('participant_start').doc();
    await recordRef.set(record);
    return recordRef;
  }

  void buttonClicked() {
    final Future<fs.DocumentReference> startRecord = createRecord();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ViewportCheckPage(id: widget.id, record: startRecord)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                  "In this study you will be asked to complete two series of attention-testing exercises. The study should take approximately 15 minutes and must be completed in one uninterrupted session.",
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
                      text:
                          "Before you begin, please read through the participation requirements below. If you cannot meet these requirements at this time, please stop and return to this page later. ",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                      text:
                          "Note: failure to follow these instructions will void your eligibility for any compensation for your participation. ",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    )
                  ]),
                  textAlign: TextAlign.left,
                  softWrap: true,
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
                  "\nIf you (a) have completed the earlier \"Media Usage Habits\" study, (b) are in a quiet location, (c) are reading this page on a laptop or desktop computer, and (d) have set the study window to full-screen mode, you may now proceed to the attention-testing exercises. To do so, click the \"Next\" button below.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 80),
                      child: ElevatedButton(
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
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(204, 0, 0, 1),
                              onPrimary: Colors.white,
                              minimumSize: Size(300.0, 55.0),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))))),
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
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text:
                          "In this study you will be asked to complete two series of attention-testing exercises. The study should take approximately 15 minutes and must be completed in one uninterrupted session. In exchange for successfully completing this study, you will be offered a \$10 Amazon gift card. ",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                      text:
                          "You MUST complete the study all the way through to the final page in order for your responses to be saved. ",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                        text:
                            "If your responses are not saved, you will not be eligible to receive a gift card.",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            color: Color.fromARGB(255, 45, 41, 38)))
                  ]),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text:
                          "\nBefore you begin, please read through the participation requirements below. If you cannot meet these requirements at this time, please stop and return to this page later. ",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    ),
                    TextSpan(
                      text:
                          "Note: failure to follow these instructions will void your eligibility for any compensation for your participation. ",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Color.fromARGB(255, 45, 41, 38)),
                    )
                  ]),
                  textAlign: TextAlign.left,
                  softWrap: true,
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
                  "Additionally, if you did not fully complete the previous survey on Qualtrics, you are not eligible to complete or receive compensation for this study.",
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
                  "\nIf you (a) have completed the earlier Qualtrics survey, (b) are in a quiet location, (c) are reading this page on a laptop or desktop computer, and (d) have set the study window to full-screen mode, you may now proceed to the attention-testing exercises. To do so, click the \"Next\" button below.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromARGB(255, 45, 41, 38)),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 80),
                      child: ElevatedButton(
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
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(204, 0, 0, 1),
                              onPrimary: Colors.white,
                              minimumSize: Size(300.0, 55.0),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))))),
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
