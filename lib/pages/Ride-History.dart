import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Drawer.dart';
import 'package:fast_aid/custom-widgets/Custom-List-Item.dart';
import 'package:fast_aid/data-models/rideHistoryModel.dart';
import 'package:fast_aid/data/userRideHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RideHistoryPage extends StatefulWidget {
  @override
  _RideHistoryPageState createState() => _RideHistoryPageState();
}

class _RideHistoryPageState extends State<RideHistoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = true;
  void demoCircularIndicator() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  Widget customLoader() {
    demoCircularIndicator();
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: kImperialRed,
        valueColor: AlwaysStoppedAnimation(kManatee),
        strokeWidth: 5,
      ),
    );
  }

  Widget rideHistoryListBuilder() {
    return ListView.builder(
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
    );
  }

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
      body: isLoading ? customLoader() : rideHistoryListBuilder(),
    );
  }
}
