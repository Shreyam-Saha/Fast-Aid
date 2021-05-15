import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAmaranthRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Display Name'),
            CircleAvatar(
              backgroundImage:
                  NetworkImage('https://www.fillmurray.com/300/300'),
              radius: 50.0,
            ),
            ElevatedButton(
                onPressed: () {
                  print('SignOut pressed');
                  Navigator.pop(context);
                },
                child: Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}
