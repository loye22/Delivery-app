import 'package:flutter/material.dart';

class rateingRes extends StatelessWidget {
  //const rateingRes({Key? key}) : super(key: key);
  final int r ;

  rateingRes(this.r);


  @override
  Widget build(BuildContext context) {
    String s ='';

     for (int i = 0 ; i < r ; i++){
      s+='⭐ ';
    }
    return Text(s);

  }
}
