import 'dart:async';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Drawer.dart';
import 'package:fast_aid/utils/authentication/google-sign-in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Sign-Up-Page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  StreamSubscription<User> loginStateSubscription;
  @override
  void initState() {
    var googleAuth = Provider.of<GoogleAuth>(context, listen: false);
    loginStateSubscription = googleAuth.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final googleAuth = Provider.of<GoogleAuth>(context);
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Display Name : ${currentUser.displayName}'),
              CircleAvatar(
                backgroundImage: (currentUser.photoURL != null)
                    ? NetworkImage(currentUser.photoURL)
                    : AssetImage('./assets/images/fallback-avatar.jpg'),
                radius: 50.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    googleAuth.signOutWithGoogle();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                        ModalRoute.withName("/"));
                  },
                  child: Text('Sign Out')),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 35, 0, 0),
          child: ElevatedButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              child: Icon(Icons.menu),
              style: kDrawerButtonStyle),
        ),
      ]),
    );
  }
}
