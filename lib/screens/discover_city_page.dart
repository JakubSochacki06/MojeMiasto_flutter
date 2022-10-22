import 'package:flutter/material.dart';
import 'package:moje_miasto/screens/city_management_page.dart';
import 'package:moje_miasto/screens/city_places_page.dart';
import 'package:moje_miasto/widgets/discover_city_button.dart';

class DiscoverCityPage extends StatelessWidget {
  DiscoverCityPage({required this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$cityName - miasto z ogromną historią',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Dowiedz się więcej o swoim mieście.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              DiscoverButton(
                  label: 'Władze miasta',
                  icon: Icons.location_city,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityManagementPage(
                            cityName: cityName,
                          );
                        },
                      ),
                    );
                  }),
              DiscoverButton(
                  label: 'Społeczność', icon: Icons.people, onTap: () {}),
              DiscoverButton(
                label: 'Miejsca warte\nodwiedzenia',
                icon: Icons.place,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CityPlacesPage(
                          cityName: cityName,
                        );
                      },
                    ),
                  );
                },
              ),
              DiscoverButton(
                  label: 'Ciekawostki',
                  icon: Icons.menu_book_outlined,
                  onTap: () {}),
            ],
          ),
        )
      ],
    );
  }
}
