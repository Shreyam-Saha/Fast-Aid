import 'dart:async';

import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/pages/Home-Page.dart';
import 'package:fast_aid/pages/Profile-Page.dart';
import 'package:fast_aid/pages/Ride-History.dart';
import 'package:fast_aid/utils/authentication/google-sign-in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kImperialRed,
            ),
            child: Text(
              'Display Name : ${currentUser.displayName}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              size: 25.0,
            ),
            title: Text('Home'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.history_outlined,
              size: 25.0,
            ),
            title: Text('Ride History'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RideHistoryPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person_outline,
              size: 25.0,
            ),
            title: Text('Profile Page'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
    );
  }
}
