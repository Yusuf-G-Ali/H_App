import 'package:flutter/material.dart';

class HalalCertification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Halal Certification',)
      ),
      body: new Center(
        child:
        new Icon(Icons.cake, size: 200.0,),
      ),
    );
  }
}