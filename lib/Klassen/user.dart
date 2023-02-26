import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {

  final  int  Id;
  final String first_name;
  final String last_name;
  final Timestamp created_time;
  final DateTime created_date;
  final Timestamp created_hour;
  final DateTime birth_date;
  final int age;
  final String street_name;
  final int street_number;
 final int  postal_code;
 final String  phone_number;
  final String  email_adress;
  final  bool is_food_prvider;

  UserInfo(
      this.Id,
      this.first_name,
      this.last_name,
      this.created_time,
      this.created_date,
      this.created_hour,
      this.birth_date,
      this.age,
      this.street_name,
      this.street_number,
      this.postal_code,
      this.phone_number,
      this.email_adress,
      this.is_food_prvider);


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
