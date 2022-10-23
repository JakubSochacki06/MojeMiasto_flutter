// Plik tworzy stronę na której widoczne są miejsca warte odwiedzenia. Informacje na temat miejsc bierze z pliku data/city_places_data.dart .
import 'package:flutter/material.dart';
import 'package:moje_miasto/data/city_places_data.dart';
import 'package:moje_miasto/screens/details_page.dart';
import 'package:moje_miasto/widgets/city_places_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CityPlacesPage extends StatelessWidget {
  CityPlacesPage({required this.cityName});
  final String cityName;
  List<String> placesNames = [];
  Map<String, List<Object>>? cityCollection;
  // Przypisanie informacji o mieście, które użytkownik wybrał w momencie rejestacji konta.
  void setManagement() {
    if (cityName == 'Katowice') {
      cityCollection = KatowicePlaces;
    } else if (cityName == 'Warszawa') {
      cityCollection = WarszawaPlaces;
    } else if (cityName == 'Gliwice'){
      cityCollection = GliwicePlaces;
    } else if (cityName == 'Wroclaw'){
      cityCollection = WroclawPlaces;
    }
  }

  void setPlacesData() {
    for (var i in cityCollection!.keys) {
      placesNames.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    setManagement();
    setPlacesData();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15,30,15,30),
          child: Column(
            children: [
              Text(
                'Miejsca warte odwiedzenia',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Odwiedź miejsca, które mają\nswoją historię',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, i) => CityPlacesButton(imageUrl: cityCollection![placesNames[i]]![0].toString(), title: placesNames[i], onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsPage(
                          address: cityCollection![placesNames[i]]![3].toString(),
                          imageUrl: cityCollection![placesNames[i]]![0].toString(),
                          lat: double.parse(cityCollection![placesNames[i]]![1].toString()),
                          long: double.parse(cityCollection![placesNames[i]]![2].toString()),
                          description: cityCollection![placesNames[i]]![4].toString(),
                          title: placesNames[i],
                          subject: 'miejsca',
                        );
                      },
                    ),
                  );
                },),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cityCollection!.length,
              ),
              TextButton(onPressed: () async{
                await launchUrl(Uri.parse('https://forms.gle/TghWDfUwhtdBW36R6'), mode: LaunchMode.externalApplication);
              }, child: Text('Uważasz, że brakuje ważnego miejsca? Kliknij tutaj aby wypełnić formularz'))
            ],
          ),
        ),
      ),
    );
  }
}
