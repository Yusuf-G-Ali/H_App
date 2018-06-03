import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('MyCart',)
      ),
      body: new Center(
        child:
        new Text('My Cart Page',
          style: new TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
