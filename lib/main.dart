import 'package:flutter/material.dart';
import 'core/main_page.dart';
import 'package:moje_miasto/screens/welcome_page.dart';
import 'package:moje_miasto/screens/register_page.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
          '/register': (context) => RegisterPage(),
          '/main':(context) => MainPage(cityName: 'test'),
        },
    );
  }
}
