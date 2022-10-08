import 'package:flutter/material.dart';

class DebriefPage extends StatefulWidget {
  final String id;
  DebriefPage({Key key, @required this.id}) : super(key: key);

  @override
  _DebriefPageState createState() => _DebriefPageState();
}

class _DebriefPageState extends State<DebriefPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ultrices venenatis ipsum eget dapibus. Fusce id ante ultrices, ultricies urna a, volutpat arcu. Nulla urna libero, tincidunt non luctus eget, viverra ut urna. Donec porttitor magna nec libero luctus, efficitur maximus felis vestibulum. Mauris nec lectus eu arcu pulvinar semper.",
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ))
                          ],
                        ))
                  ],
                ))
          ])
        ]));
  }
}
