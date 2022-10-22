import 'package:flutter/material.dart';

class DiscoverButton extends StatelessWidget {
  DiscoverButton({required this.label, required this.icon, required this.onTap});
  final String label;
  final IconData icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF71C9CE),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]
        ),
        height: 75,
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(icon, color: Colors.white,), SizedBox(height: 10,),Text(label, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)],
        ),
      ),
    );
  }
}
