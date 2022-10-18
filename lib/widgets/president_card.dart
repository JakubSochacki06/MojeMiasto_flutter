import 'package:flutter/material.dart';

class PresidentCard extends StatelessWidget {
  PresidentCard(
      {required this.name,
      required this.roomNumber,
      required this.phoneNumber,
      required this.email,
      required this.photoUrl});
  final String name;
  final String roomNumber;
  final String phoneNumber;
  final String email;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.96,
      height: height * 0.22,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(1, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: width * 0.35,
                height: height * 0.2,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(photoUrl), fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: width*0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text('$name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  Text('Numer pokoju: $roomNumber', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                  Text('Nr. telefonu: $phoneNumber', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                  Text('$email',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
