// Plik tworzy "pop-up" który wyskakuje po wciśnięciu przycisku. Zbiera on informacje na temat pomysłu, jaki użytkownik wprowadza, a następnie wysyła je do Firestore, gdzie są przechowywane a następnie odczytywane w innych plikach.
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddIdeaPopup extends StatelessWidget {
  AddIdeaPopup({required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    String ideaTitle = '';
    String ideaDescription = '';

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF757575),
        border: Border(
          top: BorderSide(width: 0, color: Color(0xFF757575)),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Dodaj swój pomysł',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Color(0xFF71C9CE),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 20,
              decoration: InputDecoration(
                  labelText: 'Wprowadź tytuł pomysłu',
              ),
              onChanged: (newText) {
                ideaTitle = newText;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 35,
              decoration: InputDecoration(
                  labelText: 'Wprowadź opis pomysłu',
              ),
              onChanged: (newText) {
                ideaDescription = newText;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final _userDoc = FirebaseFirestore.instance;
                _userDoc
                    .collection('${cityName}_community')
                    .doc('$ideaTitle')
                    .set({
                  'title': ideaTitle,
                  'description': ideaDescription,
                  'likes': 0,
                  'userLikes':[]
                });
                Navigator.pop(context);
              },
              child: Text(
                'Dodaj',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                minimumSize: Size(200, 50),
                primary: Color(0xFF71C9CE),
                onSurface: Colors.black12,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
