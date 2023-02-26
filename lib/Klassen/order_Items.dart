import 'package:flutter/material.dart';



class order_Items extends StatelessWidget {
  final int id;
  final int  order_id;
  final int  item;
  final int quantity;
  final bool order_accepted_by_food_provider;



  order_Items(this.id, this.order_id, this.item, this.quantity,this.order_accepted_by_food_provider);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
