import 'package:flutter/material.dart';
import '../multitask/instruction.dart';
import '../debrief_site/ejection.dart';

/* QAResponse
 *
 * This form asks participants to input a commitment to providing high-quality
 * responses and ejects them from the study if they fail to answer in the
 * affirmative.
 */

enum QAResponse { yes, no, maybe }

class QAForm extends StatefulWidget {
  final String id;
  QAForm({Key key, @required this.id}) : super(key: key);

  @override
  _QAFormState createState() => _QAFormState();
}

class _QAFormState extends State<QAForm> {
  QAResponse _response;

  void buttonClicked() {
    if (_response == QAResponse.yes) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Instruction(id: widget.id)));
    } else if (_response == QAResponse.no || _response == QAResponse.maybe) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Ejection(id: widget.id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextStyle defaultStyle = new TextStyle(
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color.fromARGB(255, 45, 41, 38));

    return Scaffold(
        body: Column(
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
                            fontWeight: FontWeight.normal,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 80, right: 80),
                          width: width * 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Text(
                                  "On the next pages you will complete two different exercises to test your attentional abilities.",
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: defaultStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "We care about the quality of our data. In order for us to get the most accurate measures of your abilities, it is important that you focus on the exercises, uninterrupted, for the entirety of the study session.",
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: defaultStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Do you commit to committing your attention to the upcoming exercises?",
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: defaultStyle,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Column(children: <Widget>[
                                    RadioListTile(
                                        title: Text(
                                          "I commit to giving my best answers",
                                          style: defaultStyle,
                                        ),
                                        value: QAResponse.yes,
                                        groupValue: _response,
                                        onChanged: (value) {
                                          setState(() {
                                            _response = value;
                                          });
                                        }),
                                    RadioListTile(
                                        title: Text(
                                          "I don't commit to giving my best answers",
                                          style: defaultStyle,
                                        ),
                                        value: QAResponse.no,
                                        groupValue: _response,
                                        onChanged: (value) {
                                          setState(() {
                                            _response = value;
                                          });
                                        }),
                                    RadioListTile(
                                        title: Text(
                                          "I can't commit either way",
                                          style: defaultStyle,
                                        ),
                                        value: QAResponse.maybe,
                                        groupValue: _response,
                                        onChanged: (value) {
                                          setState(() {
                                            _response = value;
                                          });
                                        })
                                  ])),
                              Padding(
                                padding: EdgeInsets.only(top: 50),
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))))),
                              ),
                            ],
                          ))
                    ])),
          ]),
          Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: Container(
                  height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
        ]));
  }
}
