import 'package:flutter/material.dart';
import 'package:order_app/bestellung.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String name;
  int quantity;
  String imageUrl;
  double price;

  Food(
      {required this.name,
      this.quantity = 0,
      required this.imageUrl,
      required this.price});

  dynamic operator [](String propertyName) {
    switch (propertyName) {
      case 'name':
        return name;
      case 'quantity':
        return quantity;
      case 'imageUrl':
        return imageUrl;
      case 'price':
        return price;
      default:
        throw Exception('Invalid property name');
    }
  }
}

class FoodList extends StatefulWidget {
  final String resturant_name;
  const FoodList({required this.resturant_name});
  @override
  _FoodListState createState() => _FoodListState(this.resturant_name);
}

class _FoodListState extends State<FoodList> {
  final String resturant_name;
  _FoodListState(this.resturant_name);
  final List<Food> _foods_Om_Anas = [
    Food(
      name: 'Pizza',
      quantity: 0,
      imageUrl: 'https://images.unsplash.com/photo-1556906786-7634f7469189',
      price: 8.99,
    ),
    Food(
        name: 'Burger',
        quantity: 0,
        imageUrl:
            'https://images.unsplash.com/photo-1519681393784-d120267933ba',
        price: 10.99),
    Food(
        name: 'Sandwich',
        quantity: 0,
        imageUrl:
            'https://images.unsplash.com/photo-1579532538587-c51e6e5d6d04',
        price: 11.99),
  ];

  final List<Food> _foods_om_Ahmad = [
    Food(name: 'RiceAndBazella', quantity: 0, imageUrl: '', price: 20.00),
    Food(name: 'kubba', quantity: 0, imageUrl: '', price: 30.00),
    Food(name: 'kabsa', quantity: 0, imageUrl: '', price: 25.00)
  ];

  @override
  Widget build(BuildContext context) {
    if (resturant_name == 'Om Anas') {
      return Scaffold(
        appBar: AppBar(title: Text('Food Items')),
        body: ListView.builder(
          itemCount: _foods_Om_Anas.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_foods_Om_Anas[index].name),
              subtitle: Text("Price: \$${_foods_Om_Anas[index].price}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _foods_Om_Anas[index].quantity++;
                      });
                    },
                  ),
                  Text(_foods_Om_Anas[index].quantity.toString()),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_foods_Om_Anas[index].quantity > 0) {
                          _foods_Om_Anas[index].quantity--;
                        }
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(
                    foodItems: _foods_Om_Anas
                        .where((item) => item['quantity'] > 0)
                        .toList()),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Food Items')),
      body: ListView.builder(
        itemCount: _foods_om_Ahmad.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_foods_om_Ahmad[index].name),
            subtitle: Text("Price: \$${_foods_om_Ahmad[index].price}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _foods_om_Ahmad[index].quantity++;
                    });
                  },
                ),
                Text(_foods_om_Ahmad[index].quantity.toString()),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_foods_om_Ahmad[index].quantity > 0) {
                        _foods_om_Ahmad[index].quantity--;
                      }
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(
                  foodItems: _foods_om_Ahmad
                      .where((item) => item['quantity'] > 0)
                      .toList()),
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final List<Food> foodItems;

  SecondPage({required this.foodItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var item in foodItems) {
      totalPrice += item.price * item.quantity;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Selected Food Items')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${foodItems[index].name}: ${foodItems[index].quantity}'),
                );
              },
            ),
          ),
          Center(
            child: ListTile(
              title: Text('Total Price'),
              trailing: Text('\$${totalPrice.toStringAsFixed(2)}'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ThirdPage(
                        fooditems: foodItems, total_price: totalPrice)),
              );
            },
            child: Text('Weiter'),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  final List<Food> fooditems;
  final double total_price;

  ThirdPage({required this.fooditems, required this.total_price});

  void printAllOrders() async {
    QuerySnapshot querySnapshot = await orders.get();
    querySnapshot.docs.forEach((doc) {
      print(doc.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    printAllOrders();
    return Scaffold(
      appBar: AppBar(title: Text('Weiter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the third page.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await orders.add({
                  'foods': 'pizza222',
                  'price': 33.10,
                  'quantity': 10,
                  'resturant_name': 'om_ahamad_new',
                  'userID': '123adajd'
                }).then((value) => print('user added'));
              },
              child: Text('Delivery'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // add logic for pick up button
              },
              child: Text('Pick up'),
            ),
          ],
        ),
      ),
    );
  }
}
