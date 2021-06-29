import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Ride-Details-Row.dart';
import 'package:fast_aid/data-models/rideHistoryModel.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  Ride rideData;
  CustomListItem({Key key, this.rideData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(rideData.toString());
    return ExpansionTile(
      leading: Icon(
        Icons.medical_services_outlined,
        size: 35,
        color: kAmaranthRed,
      ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Driver\'s Name : ',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${rideData.driverName}',
            style: TextStyle(
                color: kAmaranthRed, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Trip Date : ',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${rideData.rideDate}',
            style: TextStyle(
                color: kSpaceCadet, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
      children: <Widget>[
        Container(
          decoration: kRideHistoryItemBoxDec,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomRideDetailsRow(
                  dataTitle: 'Ride ID',
                  dataValue: rideData.rideID,
                ),
                CustomRideDetailsRow(
                  dataTitle: 'Driver\'s Name',
                  dataValue: rideData.driverName,
                ),
                CustomRideDetailsRow(
                  dataTitle: 'Driver\'s Contact',
                  dataValue: rideData.driverPhoneNumber,
                ),
                CustomRideDetailsRow(
                  dataTitle: 'Rating',
                  dataValue: rideData.ratingGiven,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.5,
                    color: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ),
                CustomRideDetailsRow(
                  dataTitle: 'Trip Chrages',
                  dataValue: '\u{20B9} ${rideData.tripCost}',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//  ListTile(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       leading: Icon(Icons.local_taxi_outlined, size: 35, color: Colors.white),
//       tileColor: kManateeLight,
//       title: Text('Driver\'s Name : ${rideData.driverName}'),
//       subtitle: Text('Trip Cost : ${rideData.tripCost}'),
//       dense: false,
//     );
