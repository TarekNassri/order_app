// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_app/Login_Files/HomePage.dart';
import 'package:order_app/get_User_Name.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfile1 extends StatelessWidget {
   EditProfile1({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return  Scaffold();
  }


}
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile> {
  final user = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("Users_id");
  late String email;
  late String password;
  late String wpassword;
  late String vorname;
  late String nachname;
  late String Strasse;
  late String PLZ;
  late String ORT;
  final email_Kontroller = TextEditingController();
  final password_Kontroller = TextEditingController();
  final wpassword_Kontroller = TextEditingController();
  final vornameKontroller = TextEditingController();
  final nachname_Kontroller = TextEditingController();
  final Strasse_Kontroller = TextEditingController();
  final PLZ_Kontroller = TextEditingController();
  final ORT_Kontroller = TextEditingController();

  Future<void> getValue() async {
    userCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // Access the data for each document using the data() method.
        final userData = doc.data()['email'];

        if (userData == user.email) {
          print(userData);
          email = doc.data()['email'];
          email_Kontroller.text = email;
          password = doc.data()['password'];
          password_Kontroller.text = password;
          wpassword = doc.data()['wpassword'];
          wpassword_Kontroller.text = wpassword;
          vorname = doc.data()['vorname'];
          vornameKontroller.text = vorname;
          nachname = doc.data()['nachname'];
          nachname_Kontroller.text = nachname;
          Strasse = doc.data()['Strasse'];
          Strasse_Kontroller.text = Strasse;
          PLZ = doc.data()['PLZ'];
          PLZ_Kontroller.text = PLZ;
          ORT = doc.data()['ORT'];
          ORT_Kontroller.text = ORT;
        }
      });
    }).catchError((error) {
      print("Error getting documents: $error");
    });
  }

  @override
  void initState() {
    getValue();
    super.initState();
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
                SizedBox(height: 20,),

                Icon(Icons.settings,
                  size: 50,
                ),
                //Hello Again
                // ignore: prefer_const_constructors


                Text("Konto Daten ändern"
                  , style: GoogleFonts.bebasNeue(
                      fontSize: 25
                  ),
                ),
                SizedBox(height: 100,),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),

                  ),
                ),
                //password Textfield
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
                        controller: vornameKontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'vorname'
                        ),
                      ),
                    ),
                  ),
                ),
                //password Textfield
                SizedBox(height: 10,),
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
                        controller: nachname_Kontroller,

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nachname'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
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
                        controller: Strasse_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Straße'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
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
                        controller: PLZ_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'PLZ'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

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
                        controller: ORT_Kontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ort'
                        ),
                      ),
                    ),
                  ),
                ),

                //password Textfield
                SizedBox(height: 10,),
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
                            border: InputBorder.none,
                            hintText: ' Password'
                        ),
                      ),
                    ),
                  ),
                ),
                // sign in button
                SizedBox(height: 10,),
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
                        controller: wpassword_Kontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Password Wiederholen'
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
                    onTap: aenderungsSpeichern,
                    child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text('Änderungsspeichern',
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,


                            ),


                          ),


                        )

                    ),
                  ),
                ),

                SizedBox(height: 10,),

                // not  a member?? register now

              ],),
          ),
        ),
      ),
    );
  }

  Future aenderungsSpeichern() async {

    CollectionReference collectionRef = FirebaseFirestore.instance.collection(
        'Users_id');
    List<String> documentIds = [];
    List<String> email1 = [];
    late String ref;
    QuerySnapshot querySnapshot = await collectionRef.get();
    querySnapshot.docs.forEach((doc) {
      documentIds.add(doc.id);
      email1.add(doc['email']);
    });

    for (var i = 0; i < documentIds.length; i++) {

      if (email1[i]==user.email) {
        ref = documentIds[i];
      }
      }

    DocumentReference docRef = collectionRef.doc(ref);

    // Update the document with new data
    docRef.update({
      'password': password_Kontroller.text,
      'wpassword': wpassword_Kontroller.text,
      'vorname': vornameKontroller.text,
      'nachname': nachname_Kontroller.text,
      'Strasse': Strasse_Kontroller.text,
      'PLZ': PLZ_Kontroller.text,
      'ORT': ORT_Kontroller.text
      ,})
        .then((value) => print('Document updated successfully'))
        .catchError((error) => print('Failed to update document: $error'));
  }

}

