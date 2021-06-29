import 'package:flutter/material.dart';

class CustomRideDetailsRow extends StatelessWidget {
  String dataTitle;
  String dataValue;
  CustomRideDetailsRow({Key key, this.dataTitle, this.dataValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(dataTitle),
          SizedBox(
            width: 40,
          ),
          Icon(
            Icons.arrow_forward,
            size: 15,
          ),
          SizedBox(
            width: 40,
          ),
          Text(dataValue)
        ],
      ),
    );
  }
}
