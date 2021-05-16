import 'package:flutter/material.dart';
import 'Color-Constants.dart';

// Add all Button Style here

ButtonStyle kButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all<double>(5.0),
  backgroundColor: MaterialStateProperty.all<Color>(kAmaranthRed),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  ),
);

ButtonStyle kGoogleSignUpButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  ),
);

//Add all Text Style here

TextStyle kButtonTextStyle =
    TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold);

TextStyle kGoogleButtonTextStyle =
    TextStyle(color: kAmaranthRed, fontWeight: FontWeight.bold);

TextStyle kFormLabelTextStyle =
    TextStyle(color: kAmaranthRed, fontSize: 20.0, fontWeight: FontWeight.bold);

TextStyle kFormInputTextStyle =
    TextStyle(color: kManatee, fontSize: 20.0, fontWeight: FontWeight.bold);

// Add all Border Style here
InputBorder kFormBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: kAmaranthRed,
    width: 2.0,
  ),
  borderRadius: BorderRadius.circular(10.0),
);
