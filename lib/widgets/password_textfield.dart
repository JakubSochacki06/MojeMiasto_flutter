// Widget, który pobiera dane na temat hasła użytkownika, który próbuje się zarejestrować/zalogować
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({required this.passwordInvisible, required this.onChanged, required this.onClickedIcon});
  final bool passwordInvisible;
  final onChanged;
  final onClickedIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: passwordInvisible, //Zamienia tekst na kropki odrazu
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color(0xFF71C9CE), width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.black12),
        ),
        hintText: 'minimum 8 znaków',
        hintStyle: TextStyle(color: Colors.black12),
        suffixIcon: IconButton(
          icon: Icon(
            // Zmiana ikony zależna od widoczności hasła
            passwordInvisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Color(0xFF71C9CE),
          ),
          onPressed: onClickedIcon,
        ),
      ),
    );
  }
}
