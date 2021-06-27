import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RideHistoryPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(children: [
        Container(),
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
