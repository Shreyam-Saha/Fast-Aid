import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home-Page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();
    final _codeContoller = TextEditingController();
    Future<bool> phoneLoginUser(
        String phoneNumber, BuildContext context) async {
      FirebaseAuth _auth = FirebaseAuth.instance;
      _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(
          seconds: 60,
        ),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential(credential);
          User user = result.user;
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, int resendToken) {
          showDialog(
              context: context,
              barrierDismissible: false,
              useSafeArea: true,
              builder: (context) {
                return AlertDialog(
                  title: Text('Enter the OTP'),
                  content: Column(
                    children: <Widget>[
                      TextField(
                        controller: _codeContoller,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode:
                                      _codeContoller.text.toString().trim());

                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            print('Error from phone verify');
                          }
                        },
                        child: Text('Confirm')),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('assets/images/login-page-image.jpg'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      child: TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        style: kFormInputTextStyle,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: kFormLabelTextStyle,
                          focusedBorder: kFormBorderStyle,
                          enabledBorder: kFormBorderStyle,
                          hintText: 'Eg.  9876543210',
                          hintStyle: kFormInputTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: kButtonStyle,
                        onPressed: () {
                          final phoneNumber =
                              '+91${_phoneController.text.trim()}';
                          print(phoneNumber);
                          phoneLoginUser(phoneNumber, context);
                        },
                        child: Text(
                          'Login',
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
