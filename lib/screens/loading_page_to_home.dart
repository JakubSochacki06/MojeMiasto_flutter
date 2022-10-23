// Ta strona odpowiedzialna jest za przekierowanie użytkownika w odpowiednie miejsce. Po poprawnym zalogowaniu/zarejestrowaniu użytkownika przez e-mail i hasło/Google przesyła go dalej, jednak na wypadek problemu informuje go o tym, lub wysyła na poprzednią stronę.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moje_miasto/screens/register_page.dart';
import 'package:moje_miasto/main_navbar/main_navbar.dart';
import 'package:moje_miasto/screens/select_city_page.dart';

class LoadingPageToHome extends StatefulWidget {
  LoadingPageToHome({required this.shouldSelectCity, required this.userChosenCity});
  final bool shouldSelectCity;
  final String userChosenCity;
  @override
  State<LoadingPageToHome> createState() => _LoadingPageToHomeState();
}

class _LoadingPageToHomeState extends State<LoadingPageToHome> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          // Sprawdza stan połączenia i w zależności od niego pokazuje na ekranie daną rzecz.
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError){
            return Center(child: Text('Błąd!\nSpróbuj zalogować się ponownie.'),);
          } else if(snapshot.hasData){
            return widget.shouldSelectCity?SelectCityPage():MainPage(cityName: widget.userChosenCity);
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
