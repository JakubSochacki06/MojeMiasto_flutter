import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moje_miasto/styles/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SelectCityPage extends StatefulWidget {
  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  final user = FirebaseAuth.instance.currentUser!;

  String userNameFromEmail = '';

  String? selectedCity;

  void setUserNameFromEmail(){
    user.email!.split('').forEach((ch){
      if(ch != "@"){
        userNameFromEmail += ch;
      } else return;
    });
  }

  List<DropdownMenuItem> getListOfAvailableCities(){
    List<String> availableCities = [
      "Głogów",
      "Warszawa",
      "Katowice"
    ];
    List<DropdownMenuItem> dropdownMenuItemslist = [];
    for(String city in availableCities){
      dropdownMenuItemslist.add(DropdownMenuItem(child: Text(city), value: city,));
    }
    return dropdownMenuItemslist;
  }

  void dropdownCallback(selectedValue){
    setState(() { selectedCity = selectedValue; });
  }

  @override
  Widget build(BuildContext context) {
    if(user.email != null){
      setUserNameFromEmail();
    }
    Text HelloText = user.displayName==null?Text('Cześć $userNameFromEmail!', textAlign: TextAlign.center, style: kHelloTextStyle,):Text('Cześć ${user.displayName}!', textAlign: TextAlign.center, style: kHelloTextStyle);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 40, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HelloText,
            Text('Czy wiedziałeś, że...?'),
            Row(
              children: [
                Image.asset('assets/question.png', width: 130, height: 130,),
                Text(
                  'W 944 miastach w Polsce\n mieszka około 40% Polaków.\n Swojego potencjału nie\n wykorzystuje połowa małych\n i jedna piąta średnich miast!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              ],
            ),
            DropdownButton(items: getListOfAvailableCities(), onChanged: dropdownCallback, value: selectedCity,),
            ElevatedButton(onPressed: (){}, child: Text('Kontynuuj'))
          ],
        ),
      )
    );
  }
}
