import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[kAmaranthRed, kImperialRed, kAliceBlue])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: 15.0,
              color: Colors.black,
            ),
            onPressed: () {
              print('Button Pressed');
            },
            label: Text(
              'Sign Up using Google',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all(kAliceBlue)),
          ),
        ],
      ),
    );
  }
}
