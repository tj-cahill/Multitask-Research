import 'package:flutter/material.dart';
import 'package:MultitaskResearch/MultiTask/instruction.dart';

class ConsentPage extends StatefulWidget {
  final String id;
  ConsentPage({Key key, @required this.id}) : super(key: key);

  @override
  _ConsentPageState createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  void buttonClicked() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Instruction(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
      children: <Widget>[
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                        Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 80, right: 80),
                      width: width * 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "All research at Boston University requires that we inform you about the study, tell you about how to contact people at Boston University if you have any questions, and let you know that your participation is voluntary and that you may withdraw at any time. This is a form that has all of this information.",
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
                              "Please print or save a copy of this page for your records. After you finish reading, please click “next”.",
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'PROTOCOL DIRECTOR: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        'James Cummings, Division of Emerging Media Studies, Boston University College of Communication',
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
                                  text: 'DESCRIPTION: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eleifend urna at mi sollicitudin, id tincidunt nibh porta. In quis nulla et est fermentum suscipit. Sed orci augue, lobortis in rhoncus vel, lobortis at lorem. Proin porttitor, mauris sit amet tincidunt sollicitudin, lectus massa efficitur orci, sed iaculis magna tellus quis odio. Vestibulum non orci sed velit cursus gravida. Praesent malesuada ipsum neque, nec venenatis nunc congue iaculis. Maecenas eu eros condimentum, facilisis lectus convallis, placerat mauris. Ut imperdiet mauris nec diam convallis, in semper lectus posuere. Etiam pharetra eros vel feugiat hendrerit. Integer dolor odio, facilisis et sodales ac, cursus at elit.',
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
                            child: Text(
                              "STUDY TASKS: ",
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              '1. Mauris volutpat ipsum eget lobortis scelerisque.',
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
                              '2. Suspendisse varius erat mattis eleifend pharetra.',
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
                              '3. Nulla pretium velit id erat malesuada ultricies.',
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
                              '4. Sed non felis aliquet, gravida magna tempus, tristique nisl.',
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
                                  text: 'ABOUT OUR SOFTWARE: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        'Sed sapien orci, mollis eget hendrerit vel, condimentum ac elit. Morbi vitae sem ac lorem volutpat tempor at eget turpis. Maecenas vulputate ex sed felis aliquet, nec efficitur velit ullamcorper. Donec vel tellus ac mi viverra imperdiet. Nullam ipsum leo, varius at neque vel, imperdiet dignissim odio. Vestibulum euismod magna eget commodo pellentesque. Sed ornare orci dapibus rutrum vehicula. Sed laoreet mollis tortor ac auctor. Donec quis nibh quam. In elementum est a nulla feugiat, sed gravida eros efficitur. Vivamus lobortis imperdiet pellentesque.',
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
                                  text: 'DURATION: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        "Donec et hendrerit neque, et pretium nulla. Aliquam suscipit non mi non bibendum. Vestibulum fermentum luctus nisi, non convallis dui vestibulum sit amet. Ut sed massa nec orci porta sagittis nec vitae erat. Integer molestie, ex tempus bibendum fringilla, augue.",
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
                                  text: 'PAYMENT: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        "Maecenas vitae ligula sed sapien laoreet ornare. Fusce sit amet dolor eros. Integer a laoreet urna. Duis nec eros risus. In vitae ex ut nibh fringilla luctus id eu lacus. Aenean blandit sollicitudin accumsan. In eros quam, dictum nec mollis eget, blandit at tortor.",
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
                                  text: 'RISKS AND BENEFITS: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        "Suspendisse fringilla malesuada mi. Vivamus fringilla scelerisque risus sed consequat. Vivamus tincidunt at velit eget luctus. Vivamus dictum elit quis urna accumsan sodales. Suspendisse pharetra condimentum sem eget aliquet. Nulla malesuada lacus sapien, finibus laoreet massa suscipit a. Proin volutpat risus diam, vel condimentum nibh hendrerit a. Nam vel mattis leo. Donec vel viverra ipsum, ut posuere dui. Nam ac congue nisi, sed molestie dui. Mauris posuere nisl libero, eu hendrerit nibh cursus sed.",
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
                                  text: 'SUBJECTS\' RIGHTS: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        "Cras consequat ligula eget nunc elementum placerat. Aliquam feugiat rutrum nunc, ac convallis leo varius in. Nulla facilisi. Vestibulum elementum consectetur ante, sed aliquam purus hendrerit nec. Sed suscipit fringilla turpis ut consequat. Integer elementum nisl ut pharetra vulputate. Pellentesque lorem eros, sodales nec neque sed, aliquet posuere odio. Nullam mattis venenatis lectus in euismod. Vestibulum convallis lacinia ex. Cras in sapien eget nunc sagittis vestibulum ut vel dui.",
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
                                  text: 'CONTACT INFORMATION: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        'If you have any questions, concerns, or complaints about this research study, its procedures, risks and benefits, you should ask the Protocol Director, James Cummings.',
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 45, 41, 38))),
                              ]),
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
                      ))
                ])),
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
