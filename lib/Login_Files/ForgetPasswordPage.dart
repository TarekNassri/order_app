// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_app/Login_Files/Utils.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final email_kontroller= TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose(){
    email_kontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
      child: Center(
      child: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
      Icon(Icons.restaurant,
      size:100,
    ),
    //Hello Again
    // ignore: prefer_const_constructors
        SizedBox(height: 10,),
        Text("OPPS..Setze dein Passwort zurück"
          ,style: GoogleFonts.bebasNeue(
              fontSize: 25
          ),
        ),
        SizedBox(height: 10,),
        //email textfield
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border:Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                controller: email_kontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText :' Email',
                ),
                autovalidateMode : AutovalidateMode.onUserInteraction,
                validator:(email_Kontroller)=>  email_Kontroller!=null && !EmailValidator.validate(email_Kontroller)
                    ?'Enter a Valid Email'
                    :null,
              ),
            ),
          ),
        ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(

              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius:BorderRadius.circular(12),
                  ),
                  child: Center (
                    child: Text ('Passwort zurücksetzen ',
                      style: TextStyle(color: Colors.white,
                        fontWeight:FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
              ),
              onTap: resetPassword,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  },
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(12),
                    ),
                    child: Center (
                      child: Text ('cancel',
                        style: TextStyle(color: Colors.black,
                          fontWeight:FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
              )
          )
      ]
      )
      )
      )
      )
    );
  }

  Future resetPassword  () async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email_kontroller.text.trim());
      Utils.showSnackerBar('Email wurde gesendt');
    }on FirebaseAuthException catch(e){
      print(e);
      Utils.showSnackerBar(e.message);
    }
  }
}
