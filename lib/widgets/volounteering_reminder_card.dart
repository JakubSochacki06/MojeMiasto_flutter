// Widget, który jest "przypominajką" o tym, że za bycie wolontariuszem nie należy się zapłata
import 'package:flutter/material.dart';

class VolReminderCard extends StatelessWidget {

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
          Container(
            width: width * 0.35,
            height: height * 0.2,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/HelpingHands.png'), fit: BoxFit.fill),
            ),
          ),
          Expanded(child: Container(child: Text('Pomoc jest dobrowolna za wykonanie przysługi nie oczekuj wynagrodzenia bądź żadnych benefitów. Pomagaj, aby świat był lepszy za darmo!', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), textAlign: TextAlign.center,))),
        ],
      ),
    );
  }
}
