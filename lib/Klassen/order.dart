
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class order extends StatelessWidget {
 final int id;
  final int user_id;
  final Timestamp order_time;
  final DateTime order_date;
  final Timestamp order_hour;



 order(this.id, this.user_id, this.order_time, this.order_date, this.order_hour);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
