import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();

    //lock screen to portrait view
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    //animations
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1200));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.decelerate,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
            image: new AssetImage('./assets/welcom.jpg'),
            fit: BoxFit.fitHeight,
            colorBlendMode: BlendMode.darken,
            color: Colors.black54),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(color: Colors.white, fontSize: 18.5),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.keyboard_arrow_right,
                size: _iconAnimation.value * 150.0,
                color: Colors.white70,
              ),
              new Container(
                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              width: 120.0,
                              child: new RaisedButton(
                                color: Colors.blue,
                                splashColor: Colors.white,
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(15.0)),
                                child: new Text(
                                  'Register',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(right: 55.0)),
                          new Expanded(
                            child: new Container(
                              width: 120.0,
                              child: new RaisedButton(
                                color: Colors.blue,
                                splashColor: Colors.white,
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(15.0)),
                                child: new Text(
                                  'Sign in',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 180.0),
                      ),
                      new Container(
                        width: 250.0,
                        child: new RaisedButton(
                          color: new Color(0xffdd4b39),
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                new IconData(0xf1a0, fontFamily: '_kFontFam'),
                                size: 25.0,
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(right: 50.0)),
                              new Text('Sign in with Google',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                      ),
                      new Container(
                        width: 250.0,
                        child: new RaisedButton(
                          color: new Color(0xff3b5998),
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                const IconData(0xf308, fontFamily: '_kFontFam'),
                                size: 25.0,
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(right: 40.0)),
                              new Text('Sign in with Facebook',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'go home',
        backgroundColor: Colors.white,
        mini: true,
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed('/HomePage'),
        child: new Icon(Icons.home),
      ),
    );
  }
}
