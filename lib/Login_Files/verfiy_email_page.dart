// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_app/Login_Files/HomePage.dart';
import 'package:order_app/Login_Files/Utils.dart';

class VerfiyEmailPage extends StatefulWidget {
  const VerfiyEmailPage({Key? key}) : super(key: key);
  @override
  State<VerfiyEmailPage> createState() => _VerfiyEmailPageState();
}

class _VerfiyEmailPageState extends State<VerfiyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
 Timer? timer;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
    timer =Timer.periodic(
     Duration(seconds: 3),
       (_)=>checkEmailVerfied(),);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  Future checkEmailVerfied() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified)timer?.cancel();
  }


  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(()=>canResendEmail=false);
      await Future.delayed(Duration(seconds: 5));
      setState(()=>canResendEmail=true);
    } catch (e) {
      Utils.showSnackerBar(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) =>
      isEmailVerified
          ? HomePage()
          :   Scaffold(
  backgroundColor: Colors.grey[300],
        body: SafeArea(
                   child: Center(
                        child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.restaurant,
                                  size:100,
                                ),
                                SizedBox(height: 25,),
                                Text("Bitte checken sie ihre Email Adresse"
                                  ,style: GoogleFonts.bebasNeue(
                                    fontSize: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: sendVerificationEmail,
                                  child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius:BorderRadius.circular(12),
                                      ),
                                      child: Center (
                                        child: Text ('Email wiedersenden',
                                          style: TextStyle(color: Colors.white,
                                            fontWeight:FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      )
                                  ),
                                ),

                                SizedBox(height: 10,),

                                GestureDetector(
                                  onTap: ()=>FirebaseAuth.instance.signOut(),
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
                                ),

                              ],
                            )
                        )
                   )
        ),
      );

}
