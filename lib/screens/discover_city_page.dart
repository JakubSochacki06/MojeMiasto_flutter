import 'package:flutter/material.dart';

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
          '$cityName jest naprawdę ciekawy!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        Text('Dowiedz się więcej o swoim mieście.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}