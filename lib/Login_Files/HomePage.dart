// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_app/Resturant_Item.dart';
import 'package:order_app/get_User_Name.dart';

import 'EditProfile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return FutureBuilder<String?>(
      future: isRestaurant(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == 'Yes') {
          // user is a restaurant
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Essen ist leben',
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[300],
                title: Center(
                  child: Text(
                    'Entdecke leckere Rezepte auf Knopfdruck',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Entdecke leckere Rezepte auf Knopfdruck',
                    ),
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.deepOrange),
              ),
              drawer: Drawer(
                backgroundColor: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                      ),
                      child: get_Value_Database('vorname'),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text(
                          'Persönliche Daten ändern',
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                    GestureDetector(
                      onTap: () => FirebaseAuth.instance.signOut(),
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.shade300, Colors.grey.shade300],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.5, 0.9],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              minRadius: 35.0,
                              child: Icon(
                                Icons.call,
                                size: 30.0,
                              ),
                            ),
                            CircleAvatar(
                              minRadius: 60.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50.0,
                                child: Icon(
                                  Icons.food_bank_outlined,
                                  size: 100.0,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.lightBlue,
                              minRadius: 35.0,
                              child: Icon(
                                Icons.message,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // user is not a restaurant
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Essen ist leben',
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[300],
                title: Center(
                  child: Text(
                    'Entdecke leckere Rezepte auf Knopfdruck',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Entdecke leckere Rezepte auf Knopfdruck',
                    ),
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.deepOrange),
              ),
              drawer: Drawer(
                backgroundColor: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                      ),
                      child: get_Value_Database('vorname'),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text(
                          'Persönliche Daten ändern',
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                    GestureDetector(
                      onTap: () => FirebaseAuth.instance.signOut(),
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.shade300, Colors.grey.shade300],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.5, 0.9],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              minRadius: 35.0,
                              child: Icon(
                                Icons.call,
                                size: 30.0,
                              ),
                            ),
                            CircleAvatar(
                              minRadius: 60.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50.0,
                                child: Icon(
                                  Icons.food_bank_outlined,
                                  size: 100.0,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.lightBlue,
                              minRadius: 35.0,
                              child: Icon(
                                Icons.message,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  returant(
                      "res1", "Om Anas", 'photo/traditional.food.Italien.png'),
                  returant(
                      "res2", "Om Ahmad", 'photo/traditional.food.Italien.png'),
                  returant(
                      "res3", "Om Anas1", 'photo/traditional.food.Italien.png'),
                  returant("res4", "Om Ahmad2",
                      'photo/traditional.food.Italien.png'),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  List<String> email2 = [];
  List<String> docIds = [];
  Future getName() async {
    await FirebaseFirestore.instance
        .collection('Users_id')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              email2.add(document['email']);
              docIds.add(document.reference.id);
            }));
  }

  Widget get_Value_Database(String value) {
    return FutureBuilder(
        future: getName(),
        builder: (context, snapshot) {
          for (var i = 0; i < docIds.length; i++) {
            if (email2[i] == user.email) {
              return get_User_Name(
                docId: docIds[i],
                value: value,
              );
            }
          }
          return Text('Loading..');
        });
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  Future<String?> isRestaurant() async {
    final user = FirebaseAuth.instance.currentUser!;
    print("user is");
    print(user.email);
    final email = user.email;

    if (email == null) {
      // User is not logged in
      return null;
    }

    final querySnapshot = await FirebaseFirestore.instance
        .collection('Users_id')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
      // User document not found
      return null;
    }

    final userDocSnapshot = querySnapshot.docs.first;
    final isRestaurantString = userDocSnapshot.get('Is_resturant') as String?;
    return isRestaurantString;
  }
}
