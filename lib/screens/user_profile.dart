import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          user.photoURL==null?Icon(FontAwesomeIcons.user):CircleAvatar(radius: 40, backgroundImage: NetworkImage(user.photoURL!),),
          user.displayName==null?Text(user.email!, textAlign: TextAlign.center):Text(user.displayName!, textAlign: TextAlign.center)
          // Text(
            // user.displayName!
          // ),
        ],
      ),
    );
  }
}
