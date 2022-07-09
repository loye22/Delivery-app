import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';

import '../widgets/rescent_order.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';

class homeScreen extends StatefulWidget {
//  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Order It',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(cartScreen.routeName);
            },
            child: Text(
              'Cart ${currentUser.cart.length} ',
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          )
        ],
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(width: 1),
                ),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                ),
                hintText: 'Search',
              ),

            ),
          ) ,
          recintOrder(),


        ],
      ),
    );
  }
}
