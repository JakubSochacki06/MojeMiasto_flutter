// Plik tworzy stronę, na której widoczne są oferty pomocy jako wolonatriusz. Informacje pobierane są z Firestore. Osoby chcące wystawić ogłoszenie mogą wypełnić formularz, który zostanie przesłany do weryfikacji.
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moje_miasto/widgets/city_places_button.dart';
import 'package:moje_miasto/screens/details_page.dart';
import 'package:moje_miasto/widgets/volounteering_reminder_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpOffersPage extends StatefulWidget {
  HelpOffersPage({required this.cityName});
  final String cityName;

  @override
  State<HelpOffersPage> createState() => _HelpOffersPageState();
}

class _HelpOffersPageState extends State<HelpOffersPage> {
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot?>(
          stream: _firestore
              .collection('${widget.cityName}_volunteering')
              .snapshots(),
          builder: (context, snapshot) {
            List<Widget>? ideaList = [];
            if (!snapshot.hasData) {
              return Center(
                  child: Text(
                      'Brak dokumentów w bazie danych. Skontaktuj się z administratorem aplikacji!'));
            } else {
              if (snapshot.data?.docs.length == 1) {
                return Center(
                    child: Text(
                  'Żadna organizacja w twoim mieście nie poprosiła jeszcze o pomoc.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32),
                ));
              }
              final offers = snapshot.data?.docs;
              for (var offer in offers!) {
                if (offer['title'] != '') {
                  ideaList.add(CityPlacesButton(
                      imageUrl: offer['imageUrl'],
                      title: offer['title'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPage(
                                address: offer['address'],
                                imageUrl: offer['imageUrl'],
                                lat: double.parse(offer['lat']),
                                long: double.parse(offer['long']),
                                description: offer['description'],
                                title: offer['title'],
                                subject: 'zajęcia',
                              );
                            },
                          ),
                        );
                      }));
                }
              }
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Pomóż lokalnym potrzebującym!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Bądź wolontariuszem w\nswoim mieście',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: ideaList,
                  ),
                  Text(
                    'Pamiętaj!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  VolReminderCard(),
                  // Tworzy przycisk, który otwiera link w osobnej karcie do formularza zgłoszeniowego.
                  TextButton(onPressed: () async{
                    await launchUrl(Uri.parse('https://forms.gle/mAToJdcyoZoAweF3A'), mode: LaunchMode.externalApplication);
                  }, child: Text('Potrzebujesz pomocy? Kliknij tutaj, aby wypełnić formularz.'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
