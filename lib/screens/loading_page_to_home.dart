// Ta strona odpowiedzialna jest za pokazanie ładowania/komunikatu z błędem gdy użytkownik próbuje się zalogować przez Google.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moje_miasto/screens/register_page.dart';
import 'package:moje_miasto/core/main_page.dart';
import 'package:moje_miasto/screens/select_city_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoadingPageToHome extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  bool shouldSelectCity = true;
  String? userChosenCity;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    void setShouldSelectCity() async {
      await for (var snapshot in _firestore.collection('user_data').snapshots()) {
        for (var message in snapshot.docs) {
          if(message.data()['user_id'] == user.uid) {
            shouldSelectCity = false;
            userChosenCity = message.data()['city'];
          }
        }
      }
    }
    setShouldSelectCity();
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
            return shouldSelectCity?SelectCityPage():MainPage(cityName: userChosenCity!);
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
