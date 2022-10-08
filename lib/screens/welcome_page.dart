import 'package:flutter/material.dart';
import 'package:moje_miasto/styles/styles.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height / 2,
              ),
              Container(
                width: width,
                height: height / 2.5,
                decoration: BoxDecoration(
                  color: Color(0xFFCBF1F5),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
              ),
              Positioned(
                top: height / 3,
                left: width / 2.7,
                // W RAZIE POTRZEBY USUNIECIA BORDERA Z AVATARA NALEZY USUNAC PIERWSZY CIRCLE AVATAR
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFCBF1F5),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/MojeMiasto.png'),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Dowiedz się wszystkiego\n o swoim mieście!',
            style: kWelcomePageMiddleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height / 3,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Row(
              children: [
                Text(
                  '  Wypróbuj za darmo!',
                  style: kWelcomePageTextButtonStyle,
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Color(0xFFCBF1F5),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Color(0xFF71C9CE),
                elevation: 0,
                fixedSize: Size(width = 200, height = 50)),
          )
        ],
      ),
    );
  }
}
