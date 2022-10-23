// Plik tworzy stronę, która pokazuje informacje o profilu oraz pozwala się wylogować z aplikacji.
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final _FirebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tekst zależny od tego, czy użytkownik zarejestrował się przez E-mail i hasło, czy konto Google.
            user.displayName==null?Text('Witaj ${user.email}!', textAlign: TextAlign.center, style: TextStyle(fontSize: 32)):Text('Witaj ${user.displayName}!', textAlign: TextAlign.center, style: TextStyle(fontSize: 32)),
            SizedBox(
              height: 20,
            ),
            // Tekst zależny od tego, czy użytkownik zarejestrował się przez E-mail i hasło, czy konto Google.
            user.photoURL==null?Icon(FontAwesomeIcons.user, size: 50,):CircleAvatar(radius: 45, child: Image.network(user.photoURL!, fit: BoxFit.cover,),),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){_FirebaseAuth.signOut();Navigator.pushNamed(context, '/register');}, child: Text('Wyloguj się'), style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              minimumSize: Size(200,50),
              primary: Color(0xFF71C9CE),
              onSurface: Colors.black12,
              elevation: 0,
            ),)
            // Text(
              // user.displayName!
            // ),
          ],
        ),
      ),
    );
  }
}
