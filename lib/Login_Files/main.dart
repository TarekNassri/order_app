// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:order_app/Login_Files/AuthPage.dart';
import 'package:order_app/Login_Files/Utils.dart';
import 'package:order_app/Login_Files/ForgetPasswordPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_app/Login_Files/verfiy_email_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(scaffoldMessengerKey: Utils.messengerKey, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Some thing went wrong"));
            }
            if (snapshot.hasData) {
              return VerfiyEmailPage();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}

class LoginDemo extends StatefulWidget {
  final VoidCallback onClickedSignUP;
  const LoginDemo({
    Key? key,
    required this.onClickedSignUP,
  }) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final email_kontroller = TextEditingController();
  final password_Kontroller = TextEditingController();
  @override
  void dispose() {
    email_kontroller.dispose();
    password_Kontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant,
                  size: 90,
                ),
                //Hello Again
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Herzlich Willkommen ",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Wir haben dich vermisst!",
                  style: GoogleFonts.bebasNeue(fontSize: 25),
                ),
                SizedBox(
                  height: 100,
                ),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: email_kontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Email',
                        ),
                      ),
                    ),
                  ),
                ),
                //password Textfield
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: password_Kontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: ' Password'),
                      ),
                    ),
                  ),
                ),
                // sign in button
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Text(
                    'Passwort vergessen',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgetPasswordPage())),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x80000000),
                                blurRadius: 12.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepOrange,
                                Colors.purple,
                              ],
                            )),
                        child: Center(
                          child: Text(
                            'Anmelden',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // not  a member?? register now
                RichText(
                    text: TextSpan(
                        text: "Nicht registriert? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUP,
                          text: "Dann registriere dich jetzt ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue))
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_kontroller.text.trim(),
          password: password_Kontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackerBar(e.message);
    }
  }

  static Widget AnimatedButton(String text) {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff33ccff),
              Color(0xffff99cc),
            ],
          )),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
