import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                  decoration: BoxDecoration(      
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.20, 0.26, 1],
                      colors: <Color>[kAmaranthRed, kImperialRed, kAliceBlue]
                    ),
                  ),
                  child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(15.0, 150.0, 0.0, 0.0),
                                child: Text(
                                  'Saving',
                                   style: TextStyle(
                                     fontSize: 60.0,
                                    // fontWeight: FontWeight.bold,
                                     color: Colors.white,
                                    ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15.0, 200.0, 0.0, 0.0),
                                child: Text(
                                  'Lives...',
                                  style: TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 70.0,
                            backgroundColor: Colors.red[400],
                          )
                        ],
                      )
                    ),

                    SizedBox(
                      height: 70.0,
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            ),
                          ),
                          
                          SizedBox(
                            height: 15.0,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                            hintText: 'Password',
                            ),
                          ),
                          
                          Container(
                            padding: EdgeInsets.fromLTRB(200.0, 10.0, 15.0, 0.0),
                            child:InkWell(
                              
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue[600],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(45.0, 30.0, 45.0, 20.0),
                            height: 100.0,
                            child: Material(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(40.0),
                              child:GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ) ,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 50.0),
                            height: 100.0,
                            child: Material(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(40.0),
                              child:GestureDetector(
                                onTap: () { print('Button Pressed'); },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        //icon: FaIcon(
                                        //  FontAwesomeIcons.google,
                                        //  size: 15.0,
                                        //  color: Colors.black,
                                        //),
                                      ),
                                      Text(
                                        'Login with Google ',
                                          style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ) ,
                            ),
                          ),
                        ],
                      ),
                    ),

                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text('New on Fast Aid?'),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child:InkWell(
                              
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue[600],
                                ),
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

        ),
      );
  }
}