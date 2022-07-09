import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class cartScreen extends StatefulWidget {
  //const cartScreen({Key? key}) : super(key: key);
  static const routeName = '/cartScreen';

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          SizedBox(
            width: 90,
          ),
          Text('Cart  ' + currentUser.cart.length.toString())
        ]),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, i) {
            if (i < currentUser.cart.length) {
              return Row(
                children: [
                  Container(
                    width: 150,
                    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        currentUser.orders[i].food.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser.orders[i].food.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          currentUser.orders[i].restaurant.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Text(
                                  '  -',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red),
                                ),
                                onTap: () {},
                              ),
                              Text(currentUser.orders[i].quantity.toString()),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '\$${currentUser.orders[i].quantity * currentUser.orders[i].food.price}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimated delivery time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('25 min' ,  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total cost',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('\$ 105' ,  style: TextStyle(color:Colors.green , fontWeight: FontWeight.bold , fontSize: 18 ))
                    ],
                  ),
                ) ,
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '    Check Out    ',
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
            );
          },
          separatorBuilder: (ctx, i) => Divider(
                height: 1,
                color: Colors.grey,
              ),
          itemCount: currentUser.cart.length + 1),
    );
  }
}
