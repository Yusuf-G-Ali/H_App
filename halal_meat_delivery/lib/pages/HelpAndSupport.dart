import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Help & Support',)
      ),
      body: new Center(
        child:
        new Icon(Icons.live_help, size: 200.0,),
      ),
    );
  }
}