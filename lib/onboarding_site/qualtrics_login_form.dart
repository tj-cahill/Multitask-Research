import 'package:flutter/material.dart';
import '../id_regex.dart';
import 'consent_page.dart';

class QualtricsLoginForm extends StatefulWidget {
  final String id;
  QualtricsLoginForm({Key key, @required this.id}) : super(key: key);

  @override
  _QualtricsLoginFormState createState() => _QualtricsLoginFormState();
}

class _QualtricsLoginFormState extends State<QualtricsLoginForm> {
  final TextEditingController _idController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _id = "";

  // Following modelled on login routine for individual tests; review later

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  _QualtricsLoginFormState() {
    _idController.addListener(_idListen);
  }

  // Validates user input to ensure that a valid Participant ID has been entered
  String _idValidator(value) {
    // Trim whitespace
    value = value.trim();

    // Validation regex
    // final RegExp sonaPattern = new RegExp(r'^U\d{8}$');
    // final RegExp qualtricsPattern = new RegExp(r'^\d{7}$|^\d{1},\d{3},\d{3}$');

    if (value == null || value.isEmpty) {
      return "Please enter a Qualtrics ID";
    } else if (!IDRegex.qualtricsPattern.hasMatch(value)) {
      return "Please enter a valid Qualtrics ID";
    }
    return null;
  }

  void _idListen() {
    if (_idController.text.isEmpty) {
      _id = "";
    } else {
      _id = _idController.text;
    }
  }

  void buttonClicked() {
    if (_formKey.currentState.validate()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ConsentPage(id: _id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: width * 0.8,
                          child: Image.asset("assets/bu_street.jpg"))
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: width * 0.8,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    "This study is run by the Communication Research Center at Boston University",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 32,
                                        color: Color.fromRGBO(204, 0, 0, 1)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text(
                                    "Please enter your Qualtrics ID below. NOTE: Before you press "Next", be sure you have clicked "Submit" in the Qualtrics study window.",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: new Container(
                                        width: 300,
                                        child: new TextFormField(
                                          autofocus: true,
                                          controller: _idController,
                                          validator: _idValidator,
                                          decoration: new InputDecoration(
                                              labelText: 'ID'),
                                        ))),
                                Padding(
                                  padding: EdgeInsets.only(top: 50, bottom: 50),
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
          ])
        ]));
  }
}
