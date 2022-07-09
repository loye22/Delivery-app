import 'package:flutter/material.dart';

import '../models/order.dart';

class helper extends StatelessWidget {
 // const helper({Key? key}) : super(key: key);
  Order order ;
  helper(this.order);



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                  child: Image.asset(order.food.imageUrl,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.food.name ,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    order.restaurant.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    order.date,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
              child: IconButton(icon: Icon(Icons.add) , onPressed: (){}, color: Colors.white,),

            )
          ],
        ),
        // child: ListView.builder(itemBuilder: itemBuilder),
      ),
    );
  }
}
