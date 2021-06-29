import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String subTitle;
  const CustomDialog({Key key, this.title, this.subTitle}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isLoading = false;

  void demoCircularIndicator() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: kImperialRed,
                valueColor: AlwaysStoppedAnimation(kManatee),
                strokeWidth: 5,
              ),
            ),
          )
        : Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kAmaranthRed,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kManatee,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        width: 150,
                        child: ElevatedButton(
                            style: kCancelButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('CANCEL',
                                textAlign: TextAlign.center,
                                style: kDriverStatusModalButtonTextStyle))),
                    Container(
                        width: 150,
                        child: ElevatedButton(
                            style: kConfirmButtonStyle,
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                              });
                              demoCircularIndicator();
                            },
                            child: Text('CONFIRM',
                                style: kDriverStatusModalButtonTextStyle))),
                  ],
                )
              ],
            ),
          );
    ;
  }
}
