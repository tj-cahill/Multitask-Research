import 'package:MultitaskResearch/OnboardingSite/consentPage.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final String id;
  LoginForm({Key key, @required this.id}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _idController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _id = "";

  // Following modelled on login routine for individual tests; review later

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  _LoginFormState() {
    _idController.addListener(_idListen);
  }

  // Validates user input to ensure that a valid Participant ID has been entered
  String _idValidator(value) {
    // Trim whitespace
    value = value.trim();

    // Validation regex
    final RegExp sonaPattern = new RegExp(r'^U\d{8}$');
    // final RegExp qualtricsPattern = new RegExp(r'^\d{7}$|^\d{1},\d{3},\d{3}$');

    if (value == null || value.isEmpty) {
      return "Please enter a Participant ID";
    } else if (!sonaPattern.hasMatch(value)) {
      return "Please enter a valid Participant ID";
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
    double height = MediaQuery.of(context).size.height;

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
/*                                 Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "1. Install an app on your phone",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ), */
                                /*  Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "2. Keep it for 2 weeks, for science!",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ), */
                                /* Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "3. We gratefully offer 30, for time and effort",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ), */
/*                                 Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Click the red button to begin.",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ), */
                                Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text(
                                    "Please enter your Participant ID below",
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
