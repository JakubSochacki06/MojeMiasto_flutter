import 'package:flutter/material.dart';
import 'package:moje_miasto/google_signin/google_signin.dart';
import 'package:moje_miasto/screens/loading_page.dart';
import 'package:moje_miasto/screens/loading_page_to_home.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData(
        ),
          initialRoute: '/',
          routes: {
            '/': (context) => welcomeScreenSeen?RegisterPage():WelcomePage(),
            '/register': (context) => RegisterPage(),
            '/loading': (context) => LoadingScreen(),
          },
      ),
    );
  }
}
