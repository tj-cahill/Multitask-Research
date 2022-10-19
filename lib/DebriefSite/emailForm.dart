import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';
import 'package:MultitaskResearch/DebriefSite/end.dart';

class EmailForm extends StatefulWidget {
  final String id;
  EmailForm({Key key, @required this.id}) : super(key: key);

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final TextEditingController _emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final fs.Firestore firestore = fb.firestore();
  String _email = "";

  // Following modelled on login routine for individual tests; review later

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  _EmailFormState() {
    _emailController.addListener(_emailListen);
  }

  String _emailValidator(value) {
    // Trim whitespace
    value = value.trim();

    // Validation regex
    // Note: This regex also allows for an empty field
    final RegExp emailPattern =
        new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$|^$');

    if (!emailPattern.hasMatch(value)) {
      return "Please enter a valid email address";
    }

    return null;
  }

  void _emailListen() {
    if (_emailController.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailController.text;
    }
  }

  void buttonClicked() {
    if (_formKey.currentState.validate()) {
      // Add email to database
      DateTime now = DateTime.now();
      Map<String, dynamic> record = {
        "id": widget.id,
        "email": _email,
        "completion_time": now.toIso8601String()
      };

      firestore
          .collection('email')
          .add(record)
          .then((value) => print(value))
          .catchError((onError) => print(onError));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => End(id: widget.id)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
        key: _formKey,
        child: Scaffold(
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
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                          )),
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
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      "The study is now complete. Thank you for your participation!",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 32,
                                          color:
                                              Color.fromARGB(255, 45, 41, 38)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ultrices venenatis ipsum eget dapibus. Fusce id ante ultrices, ultricies urna a, volutpat arcu. Nulla urna libero, tincidunt non luctus eget, viverra ut urna. Donec porttitor magna nec libero luctus, efficitur maximus felis vestibulum. Mauris nec lectus eu arcu pulvinar semper.",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                          color:
                                              Color.fromARGB(255, 45, 41, 38)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: Text(
                                      "Please enter your email address below",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                          color:
                                              Color.fromARGB(255, 45, 41, 38)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: new Container(
                                        width: 300,
                                        child: new TextFormField(
                                          autofocus: true,
                                          controller: _emailController,
                                          validator: _emailValidator,
                                          decoration: new InputDecoration(
                                              labelText: 'email'),
                                        ))),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 50, bottom: 50),
                                    child: ButtonTheme(
                                        minWidth: 300.0,
                                        height: 55.0,
                                        child: RaisedButton(
                                          child: Text("Next",
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 28,
                                                color: Colors.white,
                                              )),
                                          onPressed: this.buttonClicked,
                                          color: Color.fromRGBO(204, 0, 0, 1),
                                          splashColor:
                                              Color.fromRGBO(204, 0, 0, 1),
                                        )))
                              ],
                            ))
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 120),
                  child: Container(
                      height: 1, color: Color.fromRGBO(179, 179, 179, 1)),
                )
              ])
            ])));
  }
}
