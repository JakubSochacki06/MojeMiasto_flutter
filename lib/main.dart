import 'package:flutter/material.dart';
import 'elements/main_page.dart';
import 'package:moje_miasto/screens/welcome_page.dart';
import 'package:moje_miasto/screens/register_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool welcomeScreenSeen = false;
  @override
  Widget build(BuildContext context) {
    // Zablokowanie rotacji. Aplikacja obraca się tylko w górę i dół.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
      ),
        initialRoute: '/',
        routes: {
          '/': (context) => welcomeScreenSeen?MainPage(cityName: 'test'):WelcomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/register': (context) => RegisterPage(),
        },
    );
  }
}
