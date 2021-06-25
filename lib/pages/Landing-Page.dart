import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/pages/Profile-Page.dart';
import 'package:fast_aid/pages/Ride-History.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'Home-Page.dart';

class LandingPage extends StatelessWidget {
  PersistentTabController _bottomNavBarController =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [HomePage(), RideHistoryPage(), ProfilePage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.home,
          size: 20.0,
        ),
        title: ("Home"),
        activeColorPrimary: kImperialRed,
        inactiveColorPrimary: kManatee,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.history,
          size: 20.0,
        ),
        title: ("History"),
        activeColorPrimary: kImperialRed,
        inactiveColorPrimary: kManatee,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.user,
          size: 20.0,
        ),
        title: ("Profile"),
        activeColorPrimary: kImperialRed,
        inactiveColorPrimary: kManatee,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
        controller: _bottomNavBarController,
        items: _navBarsItems(),
        screens: _buildScreens(),
        confineInSafeArea: true,
        backgroundColor: kAliceBlue, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: kAliceBlue,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1);
  }
}
