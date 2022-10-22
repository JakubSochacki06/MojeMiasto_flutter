import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moje_miasto/widgets/community_idea_tab.dart';
class CommunityIdeasPage extends StatefulWidget {
  CommunityIdeasPage({required this.cityName});
  final String cityName;

  @override
  State<CommunityIdeasPage> createState() => _CommunityIdeasPageState();
}

class _CommunityIdeasPageState extends State<CommunityIdeasPage> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot?>(
          stream: _firestore.collection('${widget.cityName}_community').snapshots(),
          builder: (context, snapshot){
            List<CommunityIdeaTab>? ideaList = [];
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              );
            } else {
              final ideas = snapshot.data?.docs.reversed;
              for (var idea in ideas!) {
                if(idea['likes'] != -1){
                  ideaList.add(CommunityIdeaTab(title: idea['title'], shortDescription: idea['description'], likesAmount: idea['likes']));
                }
              }
            }
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              children: ideaList,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _firestore.collection('${widget.cityName}_community').add({
            'title': 'test',
            'description': 'test',
            'likes': 1,
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
