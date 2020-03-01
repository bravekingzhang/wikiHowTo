import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;

  MyErrorWidget(this.msg);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('images/cry.png',width: 64,),
        SizedBox(
          height: 15,
        ),
        Text(msg,textAlign: TextAlign.center,)
      ],
    ));
  }
}
