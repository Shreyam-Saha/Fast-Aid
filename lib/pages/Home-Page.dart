import 'dart:async';

import 'package:fast_aid/utils/authentication/google-sign-in.dart';
import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: kAmaranthRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Display Name : ${currentUser.displayName}'),
            CircleAvatar(
              backgroundImage: NetworkImage(currentUser.photoURL),
              radius: 50.0,
            ),
            ElevatedButton(
                onPressed: () {
                  googleAuth.signOutWithGoogle();
                },
                child: Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}
