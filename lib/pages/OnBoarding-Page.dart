import 'package:fast_aid/pages/Home-Page.dart';
import 'package:fast_aid/pages/Landing-Page.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  final pages = [
    SkOnboardingModel(
        title: 'Feeling Sick ?',
        description:
            'Cannot find any emergency services nearby? Don\'t worry we got you covered.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding1.png'),
    SkOnboardingModel(
        title: 'Locate nearest ambulance',
        description: 'We make requesting emergency vehicles fast and simple ',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding2.png'),
    SkOnboardingModel(
        title: 'Get healthcare fast',
        description: 'We understand how important fast medical responses are.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding3.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: SKOnboardingScreen(
          bgColor: Colors.white,
          themeColor: Color(0xFFEF233C),
          pages: pages,
          skipClicked: (value) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage()));
          },
          getStartedClicked: (value) {
            print(value);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage()));
          }),
    );
  }
}
