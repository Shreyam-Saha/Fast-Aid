import 'package:flutter/material.dart';
import 'Color-Constants.dart';

// Add all Button Style here
ButtonStyle kConfirmButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all<double>(5),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(kImperialRed),
);
ButtonStyle kCancelButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all<double>(5),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(kManatee),
);
ButtonStyle kButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all<double>(5.0),
  backgroundColor: MaterialStateProperty.all<Color>(kAmaranthRed),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  ),
);
ButtonStyle kDrawerButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(CircleBorder()),
  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
  backgroundColor: MaterialStateProperty.all(kImperialRed), // <-- Button color
  overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.pressed))
      return Colors.red.shade200;
    else
      return Colors.red.shade200; // <-- Splash color
  }),
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
TextStyle kDriverStatusModalButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);

// Add all Border Style here
InputBorder kFormBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: kAmaranthRed,
    width: 2.0,
  ),
  borderRadius: BorderRadius.circular(10.0),
);

//Container Decorations

BoxDecoration kRideHistoryItemBoxDec = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 7), // changes position of shadow
      ),
    ]);
