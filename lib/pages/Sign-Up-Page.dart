import 'dart:async';
import 'package:fast_aid/pages/OnBoarding-Page.dart';
import 'package:fast_aid/utils/authentication/google-sign-in.dart';
import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  StreamSubscription<User> loginStateSubscription;
  @override
  void initState() {
    var googleAuth = Provider.of<GoogleAuth>(context, listen: false);
    loginStateSubscription = googleAuth.currentUser.listen((fbUser) {
      if (fbUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
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
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/images/landing-page-image.jpg'),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Welcome to Fast Aid',
              style: TextStyle(
                  color: kAmaranthRed,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton.icon(
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  size: 15.0,
                  color: kAmaranthRed,
                ),
                onPressed: () {
                  //print('Button Pressed');
                  googleAuth.signInWithGoogle();
                },
                label:
                    Text('Sign Up using Google', style: kGoogleButtonTextStyle),
                style: kGoogleSignUpButtonStyle),
          ],
        ),
      ),
    ));
  }
}
