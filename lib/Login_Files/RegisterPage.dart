// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Utils.dart';

class RegisterPage extends StatefulWidget {
final Function() onClickedSignIn;

const RegisterPage(
{
Key? key,
required this.onClickedSignIn,
}
):super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final email_Kontroller= TextEditingController();
  final password_Kontroller= TextEditingController();
  final wpassword_Kontroller= TextEditingController();
  final vornameKontroller= TextEditingController();
  final nachname_Kontroller= TextEditingController();
  final Strasse_Kontroller= TextEditingController();
  final PLZ_Kontroller= TextEditingController();
  final ORT_Kontroller= TextEditingController();


  bool checkTextFieldEmptyOrNot(){
    String text1,text2 ,text3,text4 ,text5 ,text6,text7,text8;
    // Getting Value From Text Field and Store into String Variable
    text1 = email_Kontroller.text ;
    text2 = password_Kontroller.text ;
    text3 = wpassword_Kontroller.text ;
    text4 = vornameKontroller.text ;
    text5 = nachname_Kontroller.text ;
    text6 = Strasse_Kontroller.text ;
    text7 = PLZ_Kontroller.text ;
    text8 = ORT_Kontroller.text ;

    // Checking all TextFields.
    if(text1 == '' || text2 == ''|| text3 == ''|| text4 == ''|| text5 == '')
    {// Put your code here which you want to execute when Text Field is Empty.
      return false;
    }else{
      // Put your code here, which you want to execute when Text Field is NOT Empty.
      return true;
    }
  }

  @override
  void dispose() {
     email_Kontroller.dispose();
     password_Kontroller.dispose ();
     wpassword_Kontroller.dispose();
     vornameKontroller.dispose();
     nachname_Kontroller.dispose();
     Strasse_Kontroller.dispose();
     PLZ_Kontroller.dispose();
     ORT_Kontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form (
            key : formKey,
            child :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Hello Again
                // ignore: prefer_const_constructors
                SizedBox(height: 25,),
                Text("Wilkommen "
                  ,style: GoogleFonts.bebasNeue(
                      fontSize: 60
                  ),
                ),
                SizedBox(height: 10,),
                Text("Konto erstellen"
                  ,style: GoogleFonts.bebasNeue(
                      fontSize: 25
                  ),
                ),
                SizedBox(height: 100,),
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
                        controller: email_Kontroller,
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
                //password Textfield
                SizedBox(height: 10,),
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
                      child: TextField(
                        controller: vornameKontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :'Vorname'
                        ),
                      ),
                    ),
                  ),
                ),
                //password Textfield
                SizedBox(height: 10,),
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
                      child: TextField(
                        controller: nachname_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :'Nachname'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
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
                      child: TextField(
                        controller: Strasse_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :'Straße'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
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
                      child: TextField(
                        controller: PLZ_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :'PLZ'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
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
                      child: TextField(
                        controller: ORT_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :'Ort'
                        ),
                      ),
                    ),
                  ),
                ),
                //password Textfield
                SizedBox(height: 10,),
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
                        controller: password_Kontroller,
                        obscureText:true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :' Password'
                        ),
                        autovalidateMode : AutovalidateMode.onUserInteraction,
                        validator:(password_Kontroller)=>  password_Kontroller!=null && password_Kontroller.length < 6
                            ?'Password  muss mindentens 6 Buchstaben sein'
                            :null,
                      ),
                    ),
                  ),
                ),
                // sign in button
                SizedBox(height: 10,),
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
                      child: TextField(
                        controller: wpassword_Kontroller,
                        obscureText:true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText :' Password Wiederholen'
                        ),
                      ),
                    ),
                  ),
                ),
                // sign in button
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:BorderRadius.circular(12),
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
                            )
                        ),
                        child: Center (
                          child: Text ('Registrieren',
                            style: TextStyle(color: Colors.white,
                              fontWeight:FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // not  a member?? register now
                RichText(text: TextSpan(
                    text :"Hier, ",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap=widget.onClickedSignIn,
                          text: "anmelden ",
                          style: TextStyle(
                              fontWeight:FontWeight.bold,
                              color: Colors.blue
                                )
                      )
                    ]
                )
                ),
                SizedBox(height: 10,),
                // not  a member?? register now
              ],
            ),
          ),
        ),
      ),
      )
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Achtung"),
      content: Text("Bitte füllen sie alle felder aus"),
      actions: [
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future signUp () async {
    //User Auth
    final isValid = formKey.currentState!.validate();
    if (! isValid) return ;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email_Kontroller.text.trim(),
          password: password_Kontroller.text.trim()
      );
      //add User
 addUserDetails(email_Kontroller.text.trim()
     , password_Kontroller.text.trim()
     , wpassword_Kontroller.text.trim()
     ,vornameKontroller.text.trim()
     ,nachname_Kontroller.text.trim()
     ,Strasse_Kontroller.text.trim()
     ,int.parse(PLZ_Kontroller.text.trim())
     ,ORT_Kontroller.text.trim());

    } on FirebaseAuthException catch(e) {
      print(e);
      Utils.showSnackerBar(e.message);

    }
  }

  Future addUserDetails(String email,String password,String wpassword,String vorname,String nachname,String Strasse,int PLZ,String ORT) async{
    await FirebaseFirestore.instance.collection('Users_id').add(
        {'email':email,
          'password':password,
          'wpassword': wpassword,
          'vorname':vorname,
          'nachname': nachname,
          'Strasse':Strasse,
          'PLZ':PLZ,
          'ORT':ORT,
        }
    );
  }
}
