// Plik tworzy stronę, na której wypisane są ciekawostki w formie "bullet list", czyli listy punktowanej. Żeby stworzyć punkt należało utworzyć klasę z kontenerem (na samym dole), który musi wyglądać jak kropka.
import 'package:flutter/material.dart';
import 'package:moje_miasto/data/city_curiosities_data.dart';

class CuriositiesPage extends StatelessWidget {
  CuriositiesPage({required this.cityName});
  final String cityName;

  List<String> cityCollection = [];
  // Przypisanie informacji o mieście, które użytkownik wybrał w momencie rejestacji konta.
  void setCollection() {
    if (cityName == 'Warszawa') {
      cityCollection = WarszawaCuriosities;
    }
    else if(cityName == 'Gliwice'){
      cityCollection = GliwiceCuriosities;
    }
    else if(cityName == 'Wroclaw'){
      cityCollection = WroclawCuriosities;
    }
    else if(cityName == 'Katowice'){
      cityCollection = KatowiceCuriosities;
    }
  }

  @override
  Widget build(BuildContext context) {
    setCollection();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Text(
                  '$cityName - ciekawostki',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ciekawe rzeczy, o których nie każdy wie',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cityCollection.length,
                  itemBuilder: (context, i) => ListTile(
                    title: Text(cityCollection[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    leading: Bullet(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: new BoxDecoration(
        color: Color(0xFF71C9CE),
        shape: BoxShape.circle,
      ),
    );
  }
}
