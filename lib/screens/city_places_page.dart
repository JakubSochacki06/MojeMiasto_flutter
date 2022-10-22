import 'package:flutter/material.dart';
import 'package:moje_miasto/data/city_places_data.dart';
import 'package:moje_miasto/screens/city_places_details_page.dart';
import 'package:moje_miasto/widgets/city_places_button.dart';

class CityPlacesPage extends StatelessWidget {
  CityPlacesPage({required this.cityName});
  final String cityName;
  int? placesAmount;
  List<String> placesNames = [];
  Map<String, List<Object>>? cityCollection;
  void setManagement() {
    if (cityName == 'Katowice') {
      cityCollection = KatowicePlaces;
    } else if (cityName == 'Warszawa') {
      cityCollection = WarszawaPlaces;
    }
  }

  void setPlacesData() {
    int amount = 0;
    for (var i in cityCollection!.keys) {
      amount++;
      placesNames.add(i);
    }
    placesAmount = amount;
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
                        return CityPlacesDetailsPage(
                          address: cityCollection![placesNames[i]]![3].toString(),
                          imageUrl: cityCollection![placesNames[i]]![0].toString(),
                          lat: double.parse(cityCollection![placesNames[i]]![1].toString()),
                          long: double.parse(cityCollection![placesNames[i]]![2].toString()),
                          description: cityCollection![placesNames[i]]![4].toString(),
                          title: placesNames[i],
                        );
                      },
                    ),
                  );
                },),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cityCollection!.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
