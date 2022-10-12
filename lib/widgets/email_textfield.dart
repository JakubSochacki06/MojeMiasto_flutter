import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({required this.onChanged});
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF71C9CE), width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.black12),
        ),
        hintText: 'JanKowalski@onet.pl',
        hintStyle: TextStyle(color: Colors.black12),
      ),
    );
  }
}
