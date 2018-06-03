import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('About us',)
      ),
      body: new Center(
        child:
        new Icon(Icons.group, size: 200.0,),
      ),
    );
  }
}