import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rateingRes.dart';

class resturantScreen extends StatefulWidget {
  //const resturantScreen({Key? key}) : super(key: key);
  static const routeName = '/resturantScreen';

  @override
  State<resturantScreen> createState() => _resturantScreenState();
}

class _resturantScreenState extends State<resturantScreen> {
  bool i = true;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments as Restaurant;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                  tag: data.imageUrl,
                  child: Image.asset(
                    data.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                  bottom: 100,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 35,
                      ))),
              Positioned(
                  bottom: 100,
                  right: 20,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          i = !i;
                        });
                      },
                      icon: Icon(
                        i == true ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 35,
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Text(
                  '0.2 mile a way',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: rateingRes(data.rating),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              data.address,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '    Review    ',
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)))),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '    Contact    ',
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Menu',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: data.menu.length,
                  itemBuilder: (ctx, i) => Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 400,
                            width: 175,
                            //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  data.menu[i].imageUrl,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            height: 400,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.black.withOpacity(0.3),
                                  Colors.black87.withOpacity(0.3),
                                  Colors.black54.withOpacity(0.3),
                                  Colors.black38.withOpacity(0.3),
                                ],
                                stops: [.1, .5, .7, .9],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            child: Column(
                              children: [
                                Text(
                                  data.menu[i].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${data.menu[i].price.toString()}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ) ,
                          Positioned(
                            bottom: 10,
                            right: -15,
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red,
                              ),
                              child: IconButton(icon: Icon(Icons.add) , onPressed: (){}, color: Colors.white,),

                            ),
                          )
                        ],
                      )
                  //Container(width: 100, height: 100, color: Colors.red,)
                  ),
            ),
          )
        ],
      ),
    );
  }
}
