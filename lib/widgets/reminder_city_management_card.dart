import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {

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
                      image: AssetImage('assets/id-card.png'), fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text('Zabierz ze sobą dokument\npotwierdzający twoją\nosobowość. Podczas wizyty\nmożesz zostać poproszony\no okazanie jego.', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
