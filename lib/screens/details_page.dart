// Plik tworzy stronę z detalami. Wykorzystywany jest on do wykorzystywania strony z detalami na temat miejsc wartych odwiedzenia oraz do wyswietlenia detali z oferty pomocy jako wolontariusz
import 'package:flutter/material.dart';

// Klucz do geoapify, dzięki któremy można generować statyczną mapę miejsca za pomocą szerokości i długości geograficznej.
const kgeoapifyApiKey = 'a24413ce7dc04eecb9a0f316e505fa15';

class DetailsPage extends StatefulWidget {
  static const routeName = '/details-page';
  DetailsPage(
      {required this.lat,
        required this.long,
        required this.address,
        required this.imageUrl,
        required this.description,
        required this.title,
      required this.subject});
  final double lat;
  final double long;
  final String description;
  final String imageUrl;
  final String address;
  final String title;
  final String subject;
  String? mapImageUrl;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                    Text('Opis ${widget.subject}',
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