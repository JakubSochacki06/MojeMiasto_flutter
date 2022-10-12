import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moje_miasto/styles/styles.dart';
import 'package:moje_miasto/widgets/email_textfield.dart';
import 'package:moje_miasto/widgets/password_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordInvisible = true;
  bool isButtonActive = false;
  bool showSpinner = false;
  String? _userPassword;
  String? _userEmail;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Stworzenie CircleAvatara w drugim CircleAvatarze z którego jeden ma większy radius od drugiego sprawia, że powstaje ramka wokół mniejszego CirlceAvatara.
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFCBF1F5),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/MojeMiasto.png'),
                  ),
                ),
                Text(
                  'Poznaj swoje miasto',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Podaj swój adres e-mail',
                ),
                EmailTextField(
                  onChanged: (value) {
                    _userEmail = value;
                    // Sprawdza czy wszystkie wymogi zostały spełnione, aby przycisk był aktywny
                    if (_userPassword?.length != null) {
                      if (_userPassword!.length >= 8 &&
                          _userEmail != '' &&
                          _userEmail != null) {
                        setState(() {
                          isButtonActive = true;
                        });
                      } else {
                        setState(() {
                          isButtonActive = false;
                        });
                      }
                    }
                  },
                ),
                Text('Podaj swoje hasło'),
                PasswordTextField(
                  passwordInvisible: _passwordInvisible,
                  onClickedIcon: () {
                    // Włączenie/wyłączenie widoczności hasła
                    setState(() {
                      _passwordInvisible = !_passwordInvisible;
                    });
                  },
                  onChanged: (value) {
                    // Za każdym razem, gdy zostaje zmieniona/dopisana/usunieta litera z pola tekstowego końcowe hasło zostaje przypisane do całości
                    _userPassword = value;
                    // Sprawdza czy wszystkie wymogi zostały spełnione, aby przycisk był aktywny
                    if (_userPassword?.length != null) {
                      if (_userPassword!.length >= 8 &&
                          _userEmail != '' &&
                          _userEmail != null) {
                        setState(() {
                          isButtonActive = true;
                        });
                      } else {
                        setState(() {
                          isButtonActive = false;
                        });
                      }
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: isButtonActive
                      // Co się stanie gdy przycisk będzie aktywny

                      ? () async{
                    setState(() { showSpinner = true; });
                    // Tworzy użytkownika oraz dodaje go do bazy danych Firebase

                    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                    try {
                      final user = await _firebaseAuth.createUserWithEmailAndPassword(email: _userEmail!, password: _userPassword!);
                      // Co się stanie jeśli użytkownik zostanie poprawnie zarejestrowany
                      if (user != null){
                        Navigator.pushNamed(context, '/main');
                      }
                    }
                    catch(e) {
                      // TODO: DOPRACOWAC SNACKBARA ZEBY NIE POKAZYWAL TYCH CZARNYCH BOKOW. NA DOLE DOKUMENTACJI JEST FILMIK GDZIE ZIOMEK ROBI NA FLUTTER WAY OD 0
                      var snackBar = SnackBar(
                        content: AwesomeSnackbarContent(
                          title: 'Błąd!',
                          message: 'Sprawdź poprawność e-maila.',
                          contentType: ContentType.failure,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      print(e);
                    }
                    setState(() { showSpinner = false; });
                        }


                      //  Co się stanie gdy przycisk nie będzie aktywny
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xFF71C9CE),
                    onSurface: Colors.black12,
                    elevation: 0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Kontynuuj',
                            style: TextStyle(
                              // Kolor przycisku zależny od tego, czy wszystkie wymogi zostały spełnione
                              color: isButtonActive
                                  ? Color(0xFFEFF1F5)
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            // Kolor ikony zależny od stanu przycisku
                            color: isButtonActive
                                ? Color(0xFFEFF1F5)
                                : Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(color: Colors.black26),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
