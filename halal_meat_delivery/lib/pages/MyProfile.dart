import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('My Profile',)
      ),
      body: new Center(
        child:
          new Icon(Icons.face, size: 200.0,),
      ),
    );
  }
}