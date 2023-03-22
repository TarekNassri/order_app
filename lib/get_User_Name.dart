import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';



class get_User_Name extends StatelessWidget {
  final String docId;
  final String value ;
  get_User_Name({

    required this.docId,
    required this.value

  });
  @override
  Widget build(BuildContext context) {
    CollectionReference Users_id = FirebaseFirestore.instance.collection('Users_id');
    return FutureBuilder<DocumentSnapshot>(
      future: Users_id.doc(docId).get(),
      builder: ((context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
         //print(snapshot.data!.data());
          Map<String,dynamic>data= snapshot.data!.data() as Map<String,dynamic>;
            return Text(data[value],
                style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: Colors.black
                )
            );
        }
        return Text('Loading...');
      }
      ),
    );
  }
}
