import 'package:flutter/material.dart';

class End extends StatefulWidget {
  final String id;
  End({Key key, @required this.id}) : super(key: key);

  @override
  _EndState createState() => _EndState();
}

class _EndState extends State<End> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                padding: EdgeInsets.only(top: 30, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: width * 0.8,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Your response has been recorded. Thank you for your participation!",
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 32,
                                    color: Color.fromARGB(255, 45, 41, 38)),
                              ),
                            ]))
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 120),
              child:
                  Container(height: 1, color: Color.fromRGBO(179, 179, 179, 1)),
            )
          ])
        ]));
  }
}
