import 'package:flutter/material.dart';
import 'package:moje_miasto/data/city_data.dart';
import 'package:moje_miasto/widgets/president_card.dart';
import 'package:moje_miasto/widgets/bottom_card_city_management.dart';
import 'package:moje_miasto/widgets/reminder_city_management_card.dart';
class CityManagementPage extends StatelessWidget {
  CityManagementPage({required this.cityName});
  final String cityName;
  Map<String, List<Object>>? cityCollection;
  void setManagement() {
    if (cityName == 'Katowice') {
      cityCollection = Katowice;
    }
    else if(cityName == 'Warszawa'){
      cityCollection = Warszawa;
    }
  }

  @override
  Widget build(BuildContext context) {

    setManagement();
    // zamiana objektu na listę, aby miec dostep do calej listy z informacjami kazdego z zastepcow
    List<String> zastepca1 = cityCollection!['Zastepcy']![0] as List<String>;
    List<String> zastepca2 = cityCollection!['Zastepcy']![1] as List<String>;
    List<String> zastepca3 = cityCollection!['Zastepcy']![2] as List<String>;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Władza miasta',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Poznaj samorząd miasta!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Prezydent', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  PresidentCard(name: cityCollection!['Prezydent']![0].toString(), roomNumber: cityCollection!['Prezydent']![1].toString(), phoneNumber: cityCollection!['Prezydent']![2].toString(), email: cityCollection!['Prezydent']![3].toString(), photoUrl: cityCollection!['Prezydent']![4].toString()),
                  Text('Zastępcy', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  PresidentCard(name: zastepca1[0], roomNumber: zastepca1[1], phoneNumber: zastepca1[2], email: zastepca1[3], photoUrl: zastepca1[4]),
                  PresidentCard(name: zastepca2[0], roomNumber: zastepca2[1], phoneNumber: zastepca2[2], email: zastepca2[3], photoUrl: zastepca2[4]),
                  PresidentCard(name: zastepca3[0], roomNumber: zastepca3[1], phoneNumber: zastepca3[2], email: zastepca3[3], photoUrl: zastepca3[4]),
                  Text('Skarbnik', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  PresidentCard(name: cityCollection!['Skarbnik']![0].toString(), roomNumber: cityCollection!['Skarbnik']![1].toString(), phoneNumber: cityCollection!['Skarbnik']![2].toString(), email: cityCollection!['Skarbnik']![3].toString(), photoUrl: cityCollection!['Skarbnik']![4].toString()),
                  Text('Sekretarz', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  PresidentCard(name: cityCollection!['Sekretarz']![0].toString(), roomNumber: cityCollection!['Sekretarz']![1].toString(), phoneNumber: cityCollection!['Sekretarz']![2].toString(), email: cityCollection!['Sekretarz']![3].toString(), photoUrl: cityCollection!['Sekretarz']![4].toString()),
                  Text(
                    'Urząd miasta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  BottomCardCityManagement(street: cityCollection!['Urzad miasta']![0].toString(), photoUrl: cityCollection!['Urzad miasta']![1].toString(),),
                  Text(
                    'Pamiętaj!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  ReminderCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
