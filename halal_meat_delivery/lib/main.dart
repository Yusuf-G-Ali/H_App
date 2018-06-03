import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/SplashScreen.dart';

void main() => runApp(new HalalMeatApp());

class HalalMeatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SplashScreen(),
      title: 'Halal Meat Delivery',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) =>
            new HomePage(title: 'Halal Meat Delivery')
      },
    );
  }
}
