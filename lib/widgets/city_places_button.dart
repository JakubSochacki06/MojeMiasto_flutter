import 'package:flutter/material.dart';

class CityPlacesButton extends StatelessWidget {
  CityPlacesButton(
      {required this.imageUrl,
        required this.title,
        required this.onTap
      });
  final String? imageUrl;
  final String? title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              ),]
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Text(
              title!,
              textAlign: TextAlign.center,
            ),
            Icon(Icons.arrow_forward),
            SizedBox(height: 3,)
          ],
        ),
      ),
    );
  }
}