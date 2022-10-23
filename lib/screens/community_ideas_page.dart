// Plik tworzy stronę z pomysłami użytkowników. Informacje na ich temat odczytuje z Firestore. Sortuje pomysłu zaczynając od tego, który ma najwięcej "like'ów" (łapek w górę), pozwala głosować na pomysł, który według użytkowników jest najlepszy. Nawet po wylogowaniu i ponownym zalogowaniu pokazuje informację, na który pomysł użytkownik zagłosował (może ich być wiele)
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moje_miasto/widgets/community_idea_tab.dart';
import 'package:moje_miasto/screens/add_idea_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CommunityIdeasPage extends StatefulWidget {
  CommunityIdeasPage({required this.cityName});
  final String cityName;

  @override
  State<CommunityIdeasPage> createState() => _CommunityIdeasPageState();
}

class _CommunityIdeasPageState extends State<CommunityIdeasPage> {
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot?>(
          stream: _firestore.collection('${widget.cityName}_community').orderBy('likes', descending: true).snapshots(),
          builder: (context, snapshot){
            List<CommunityIdeaTab>? ideaList = [];
            if(!snapshot.hasData){
              if(snapshot.data?.docs.length == 1){
                return Center(
                    child: Text('Brak dokumentów w bazie danych. Skontaktuj się z administratorem aplikacji')
                );
              }
            } else {
              if(snapshot.data?.docs.length == 1){
                return Center(
                    child: Text('Żaden pomysł w twoim mieście nie został jeszcze dodany. Kliknij "+" aby dodać swój pomysł.', textAlign: TextAlign.center, style: TextStyle(fontSize: 32),)
                );
              }
              final ideas = snapshot.data?.docs;
              for (var idea in ideas!) {
                // sprawdza czy polubiliśmy dany pomysł
                bool alreadyLiked = false;
                for(var userLikes in idea['userLikes']){
                  if(userLikes == user.uid){
                    alreadyLiked = true;
                  }
                }
                // za każdy pomysł w bazie danych tworzy CommunityIdeaTab (oprócz tego, który ma -1 polubień, ponieważ jest on "Placeholderem", który ma być wzorcem do zapisu pomysłu w bazie danych)
                if(idea['likes'] != -1){
                  ideaList.add(CommunityIdeaTab(title: idea['title'], shortDescription: idea['description'], likesAmount: idea['likes'], cityName: widget.cityName, alreadyLiked: alreadyLiked,));
                }
              }
            }
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: ideaList,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // makes it to sit right above keyboard
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).viewInsets.bottom == 0 ? 350 : MediaQuery.of(context).viewInsets.bottom + 200,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddIdeaPopup(
                  cityName: widget.cityName,
                ),
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF71C9CE),
        child: Icon(Icons.add),
      ),
    );
  }
}
