// Widget pokazujący pomysł dodany przez użytkownika.
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CommunityIdeaTab extends StatefulWidget {
  CommunityIdeaTab({required this.title, required this.shortDescription, required this.likesAmount, required this.cityName, required this.alreadyLiked});
  final String title;
  final String shortDescription;
  final int likesAmount;
  final String cityName;
  final bool alreadyLiked;

  @override
  State<CommunityIdeaTab> createState() => _CommunityIdeaTabState();
}

class _CommunityIdeaTabState extends State<CommunityIdeaTab> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(widget.shortDescription, style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),)
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${widget.likesAmount.toString()}'),
                SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: (){
                  if(widget.alreadyLiked != true){
                    final _userDoc = FirebaseFirestore.instance.collection('${widget.cityName}_community').doc('${widget.title}');
                    _userDoc.update({'likes':int.parse('${widget.likesAmount + 1}')});
                    final user = FirebaseAuth.instance.currentUser!;
                    _userDoc.update({'userLikes':FieldValue.arrayUnion([user.uid])});
                  } else {
                    final _userDoc = FirebaseFirestore.instance.collection('${widget.cityName}_community').doc('${widget.title}');
                    if(widget.likesAmount != 0){
                      _userDoc.update({'likes':int.parse('${widget.likesAmount - 1}')});
                      final user = FirebaseAuth.instance.currentUser!;
                      _userDoc.update({'userLikes':FieldValue.arrayRemove([user.uid])});
                    }
                  }
                }, icon: Icon(Icons.thumb_up, color: widget.alreadyLiked?Colors.blueAccent:Colors.black12,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
