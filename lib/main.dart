import 'dart:async';
import 'package:MultitaskResearch/FocusTest/login.dart';
import 'package:MultitaskResearch/KEYS.dart';
import 'package:MultitaskResearch/MultiTask/login.dart';
import 'package:MultitaskResearch/OnboardingSite/sonaLoginForm.dart';
import 'package:MultitaskResearch/OnboardingSite/qualtricsLoginForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
// import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  if (Firebase.apps.isEmpty) {
    Firebase.initializeApp(
        apiKey: KEYS.apiKey,
        authDomain: KEYS.authDomain,
        databaseURL: KEYS.databaseURL,
        projectId: KEYS.projectId,
        storageBucket: KEYS.storageBucket,
        messagingSenderId: KEYS.messagingSenderId,
        appId: KEYS.appId,
        measurementId: KEYS.measurementId);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multitasking Measurement',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding', // Change as necessary for debugging
      onGenerateRoute: generateRoute,
    );
  }
}

class RoutingData {
  final String route;
  final Map<String, String> _queryParameters;

  RoutingData({
    this.route,
    Map<String, String> queryParameters,
  }) : _queryParameters = queryParameters;

  operator [](String key) => _queryParameters[key];
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData;
  switch (routingData.route) {
    case '/multitask':
      return MaterialPageRoute(
          builder: (_) => MultiTaskLogin(
                id: routingData._queryParameters["id"],
              ));
    case '/testfocus':
      return MaterialPageRoute(
          builder: (_) => TestFocusLogin(
                id: routingData._queryParameters["id"],
              ));
    case '/onboarding':
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: SonaLoginForm(
                id: routingData._queryParameters["id"],
              )));
    case '/qonboarding':
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: QualtricsLoginForm(
                id: routingData._queryParameters["id"],
              )));
/*     case '/debrief':
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: DebriefForm(
                id: routingData._queryParameters["id"],
              ))); */
/*     case '/export':
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                const url =
                    'https://us-central1-common-research.cloudfunctions.net/csvJsonReport';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text('Export the data'),
            ),
          ),
        ),
      ); */
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
