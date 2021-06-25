import 'package:fast_aid/pages/Landing-Page.dart';
import 'package:fast_aid/pages/Sign-Up-Page.dart';
import 'package:fast_aid/utils/authentication/google-sign-in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GoogleAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.blue,
        ),
        home: GoogleAuth().isSignedIn ? LandingPage() : SignUpPage(),
      ),
    );
  }
}
