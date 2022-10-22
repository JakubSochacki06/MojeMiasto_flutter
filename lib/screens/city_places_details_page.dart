import 'package:flutter/material.dart';
import 'dart:io';


const kgeoapifyApiKey = 'a24413ce7dc04eecb9a0f316e505fa15';

class CityPlacesDetailsPage extends StatefulWidget {
  static const routeName = '/details-page';
  CityPlacesDetailsPage(
      {required this.lat,
        required this.long,
        required this.address,
        required this.imageUrl,
        required this.description,
        required this.title});
  final double lat;
  final double long;
  final String description;
  final String imageUrl;
  final String address;
  final String title;
  String? mapImageUrl;

  @override
  State<CityPlacesDetailsPage> createState() => _CityPlacesDetailsPageState();
}

class _CityPlacesDetailsPageState extends State<CityPlacesDetailsPage> {
  Future<void> getMapImage() async {
    setState(() {
      widget.mapImageUrl =
      'https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=400&center=lonlat:${widget.long},${widget.lat}&zoom=15&marker=lonlat:${widget.long},${widget.lat};type:material;color:%23ff3421;icontype:awesome&apiKey=$kgeoapifyApiKey';
    });
  }

  @override
  Widget build(BuildContext context) {
    getMapImage();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 40, 15, 40),
          child: ListView(
            children: [
              Text(widget.title,
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(height: 20,),
              FittedBox(
                child: Image.network(widget.imageUrl), fit: BoxFit.cover),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text('Opis miejsca',
                        style: TextStyle(
                          fontSize: 35,
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${widget.description}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Adres',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 200,
                  width: 200,
                  child: Image.network(widget.mapImageUrl!)),
              SizedBox(
                height: 15,
              ),
              Text(widget.address,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}