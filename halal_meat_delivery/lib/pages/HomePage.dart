import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'MyCart.dart';
import 'MyProfile.dart';
import 'HalalCertifications.dart';
import 'Products.dart';
import 'HelpAndSupport.dart';
import 'AboutUs.dart';
import 'dart:async';
import 'LoginPage.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  String _userName = 'guest';
  String _userEmail = "Sign In";
  String _photoUrl;

  void _updateUserInfo(String name, String email, String photoUrl){
    setState((){
      _userName = name;
      _userEmail = email;
      _photoUrl = photoUrl;
    });
  }

  Future<FirebaseUser> _signIn() async {

    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    _updateUserInfo(user.displayName, user.email, googleSignInAccount.photoUrl);
    return user;
  }

  Widget _signInStatus(){
    if (_userName == 'guest'){
      return new ListTile(
        title: new Text("Sign In",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        leading: new Icon(const IconData(0xe800, fontFamily: '_kFontFam')),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPage()
        )),);
    }else {
      return new ListTile(
        title: new Text("Log Out",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        leading: new Icon(Icons.power_settings_new),
        onTap: () => _signOut(),
      );
    }
  }
  void _signOut() {
    googleSignIn.signOut();
    Navigator.pop(context);
    _updateUserInfo("guest", 'SignIn', null);
  }

  ImageProvider _profileImage() {
    if (_photoUrl != null) {
      return NetworkImage(_photoUrl);
    } else {
      return AssetImage('./assets/user.png');
    }
  }

  /// create card for a grid view
  _card(Widget img) {
    return new Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Expanded(
            child: new Container(child: img),
          ),
        ],
      ),
    );
  }

  _gridViewBuilder() {
    return new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 5.0),
        child: GridView.count(
            mainAxisSpacing: 2.0,
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            children: <Widget>[
              GestureDetector(
                child: _card(
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage('./assets/chicken.png'),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Chicken())),
              ),
              GestureDetector(
                child: _card(
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage('./assets/sheep.png'),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Sheep())),
              ),
              GestureDetector(
                child: _card(
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage('./assets/goat.png'),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Goat())),
              ),
              GestureDetector(
                child: _card(
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage('./assets/cow.png'),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Cow())),
              ),
              GestureDetector(
                child: _card(
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage('./assets/fish.png'),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Fish())),
              ),
              GestureDetector(
                child: _card(
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage('./assets/offers.png'),
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Offers())),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: new Drawer(
        child: new InkWell(
          onTap: () => null,
          splashColor: Colors.grey[800],
          child: ListView(
            children: <Widget>[
              //if user not logged in yet
              new UserAccountsDrawerHeader(
                accountName:  new Text('Welcome $_userName'),
                accountEmail: new GestureDetector(
                  child: new Text(_userEmail),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => new LoginPage(),),)
                ),
                currentAccountPicture: new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: _profileImage(),
                    ),
                    onTap: () => null),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: const AssetImage('./assets/halal.png'),
                      backgroundColor: Colors.grey,
                    ),
                    onTap: () => null,
                  ),
                ],
              ),

              new ListTile(
                selected: true,
                title: new Text("Home",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: new Icon(Icons.home),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/HomePage'),
              ),
              new ListTile(
                title: new Text("My Profile",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: new Icon(Icons.person),
                onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MyProfile())),
              ),
              new ListTile(
                  title: new Text("My Cart",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  leading: new Icon(Icons.shopping_cart),
                  onTap: () => Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyCart()),
                      )),
              new ListTile(
                title: new Text("Halal Certifications",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: new Icon(Icons.verified_user),
                onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HalalCertification())),
              ),
              new Divider(),
              new ListTile(
                title: new Text("Help & support",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: new Icon(Icons.live_help),
                onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HelpAndSupport())),
              ),
              new ListTile(
                title: new Text("About us",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: new Icon(Icons.group),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new AboutUs())),
              ),
              _signInStatus(),
              new ListTile(
                title: new Text("close",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),

      body: _gridViewBuilder(),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Go to cart',
          child: new Icon(Icons.shopping_cart),
          onPressed: () => Navigator.push(
                context, new MaterialPageRoute(builder: (context) => new MyCart()),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
