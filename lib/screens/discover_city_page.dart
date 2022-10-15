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
        Text('$cityName jest naprawdę ciekawe!')
      ],
    );
  }
}
