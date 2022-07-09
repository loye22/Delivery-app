import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/widgets/helperWidget.dart';
import 'package:food_delivery_app/widgets/rateingRes.dart';
import 'package:food_delivery_app/screens/resturant_screen.dart';

class recintOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Recint Order',
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: 1),
            ),
          ),
          Container(
            height: 140,
            child: ListView.builder(
              itemCount: currentUser.orders.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (cxt, i) => helper(currentUser.orders[i]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'Nearby Resturant',
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              ),
              Column(
                children: restaurants
                    .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                resturantScreen.routeName,
                                arguments: e);
                          },
                          child: nearByRes(
                            url: e.imageUrl,
                            rating: e.rating,
                            name: e.name,
                            address: e.address,
                          ),
                        ))
                    .toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class nearByRes extends StatelessWidget {
  final String url;
  final String name;

  final String address;
  final int rating;

  const nearByRes({Key key, this.url, this.name, this.address, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        //    borderRadius: BorderRadius.circular(40),
        child: Card(
          elevation: 6,
          child: Container(
            decoration: BoxDecoration(
                //    border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  //         borderRadius: BorderRadius.circular(30),
                  child: Hero(
                    tag: url,
                    child: Image.asset(
                      url,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      rateingRes(rating),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        address,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      Text(
                        '0.2 mile away',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
