import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:moje_miasto/screens/user_profile.dart';


class MainPage extends StatefulWidget {
  MainPage({required this.cityName});
  final String cityName;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'POZNAJ SCREEN Z UZYCIEM DANEGO MIASTA',
    ),
    Text(
        'POMYSLY'
    ),
    Text(
      'POMOZ',
    ),
    UserProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(0xFFCBF1F5),
              // KOLOR Z TYLU
              color: Colors.black,
              // KOLOR IKON
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Poznaj',
                ),
                GButton(
                  icon: LineIcons.users,
                  text: 'Pomysły',
                ),
                GButton(
                  icon: LineIcons.helpingHands,
                  text: 'Pomóż',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}