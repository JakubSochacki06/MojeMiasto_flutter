import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moje_miasto/screens/register_page.dart';
import 'package:moje_miasto/core/main_page.dart';
class LoadingPageToHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError){
            return Center(child: Text('Błąd!\nSpróbuj zalogować się ponownie.'),);
          } else if(snapshot.hasData){
            return MainPage(cityName: 'Test');
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
