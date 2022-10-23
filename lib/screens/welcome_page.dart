// Plik tworzy stronę, która wyświetla się użytkownikowi od razu po włączeniu aplikacji.
import 'package:flutter/material.dart';

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
                left: width / 2.85,
                // W razie potrzeby usunięcia bordera z avatara należy usunąć pierwszy CircleAvatar
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Aktualnie obsługujemy 4 miasta!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
          ),
          SizedBox(
            height: 15,
          ),
          Container(child: Image.asset('assets/SmartCity.png'), width: width*0.6, height: height*0.2,),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wypróbuj za darmo!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
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
