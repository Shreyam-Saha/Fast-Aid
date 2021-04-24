import 'package:fast_aid/pages/Login-Page.dart';
import 'package:flutter/material.dart';
import 'package:fast_aid/constants/TextStyle-Constants.dart';
import 'constants/Color-Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
