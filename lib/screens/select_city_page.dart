// Plik tworzy stronę, gdzie dopiero zarejestrowany użytkownik może wybrać miasto. Informacje na temat użytkownika i jego wyborze zostają wysłane do bazy danych Firestore.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moje_miasto/main_navbar/main_navbar.dart';

class SelectCityPage extends StatefulWidget {
  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _firestore = FirebaseFirestore.instance;
  bool isButtonActive = false;
  String userNameFromEmail = '';

  String? selectedCity;

  void setUserNameFromEmail() {
    for(String ch in user.email!.split('')){
      if (ch != "@") {
        userNameFromEmail += ch;
      } else {
        break;
      }
    }
  }

  List<DropdownMenuItem> getListOfAvailableCities() {
    List<String> availableCities = ["Gliwice", "Katowice", "Warszawa", "Wroclaw",];
    List<DropdownMenuItem> dropdownMenuItemslist = [];
    for (String city in availableCities) {
      dropdownMenuItemslist.add(DropdownMenuItem(
        child: Text(city),
        value: city,
      ));
    }
    return dropdownMenuItemslist;
  }

  void dropdownCallback(selectedValue) {
    setState(() {
      selectedCity = selectedValue;
      isButtonActive = true;
    });
  }

  @override
  void initState() {
    if (user.email != null) {
      setUserNameFromEmail();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Text HelloText = user.displayName == null
        // Tekst zależny od tego, czy użytkownik zarejestrował się przez E-mail i hasło, czy konto Google.
        ? Text(
            'Cześć $userNameFromEmail!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          )
        : Text('Cześć ${user.displayName}!',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700));
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 40, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HelloText,
              Column(
                children: [
                  Text(
                    'Czy wiedziałeś, że...?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF71C9CE), width: 2.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/question.png',
                          width: 130,
                          height: 130,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'W 944 miastach w Polsce mieszka około 40% Polaków. Swojego potencjału nie wykorzystuje połowa małych i jedna piąta średnich miast!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Text('Wybierz miasto, aby kontynuować', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              DropdownButton(
                items: getListOfAvailableCities(),
                onChanged: dropdownCallback,
                value: selectedCity,
              ),
              ElevatedButton(
                onPressed: isButtonActive?(){
                  _firestore.collection('user_data').add({
                    'city':selectedCity,
                    'user_id':user.uid,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage(cityName: selectedCity!,)),
                  );
                }:null,
                child: Text('Kontynuuj'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  minimumSize: Size(200,50),
                  primary: Color(0xFF71C9CE),
                  onSurface: Colors.black12,
                  elevation: 0,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
