import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityIdeasPage extends StatefulWidget {
  CommunityIdeasPage({required this.cityName});
  final String cityName;
  final _firestore = FirebaseFirestore.instance;

  void getIdeas() async{
    await for (var snapshot in _firestore.collection('${cityName}_community').snapshots()) {
      for (var message in snapshot.docs) {

      }
    }
  }
  @override
  State<CommunityIdeasPage> createState() => _CommunityIdeasPageState();
}

class _CommunityIdeasPageState extends State<CommunityIdeasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
