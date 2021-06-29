import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Drawer.dart';
import 'package:fast_aid/custom-widgets/Custom-List-Item.dart';
import 'package:fast_aid/data/userRideHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RideHistoryPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kImperialRed,
        title: Text(
          'Your Ride History',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5),
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: userRideHistoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: kRideHistoryItemBoxDec,
              child: CustomListItem(
                rideData: userRideHistoryList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
