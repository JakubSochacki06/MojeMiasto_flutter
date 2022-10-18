import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moje_miasto/screens/loading_page_to_home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  bool shouldSelectCity = true;
  String userChosenCity = 'none';
  @override
  void initState() {
    setShouldSelectCity();
    super.initState();
  }

  void setShouldSelectCity() async {
    await for (var snapshot in _firestore.collection('user_data').snapshots()) {
      for (var message in snapshot.docs) {
        if(message.data()['user_id'] == user.uid) {
          userChosenCity = message.data()['city'];
          shouldSelectCity = false;
        } else{
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoadingPageToHome(
                  userChosenCity: userChosenCity,
                  shouldSelectCity: shouldSelectCity,
                );
              },
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}