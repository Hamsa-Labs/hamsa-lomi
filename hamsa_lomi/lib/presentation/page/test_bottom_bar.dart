import 'package:flutter/material.dart';
import '../constants/app_assets_constant.dart';
import '../share_widgets/appbar_widget.dart';
import '../share_widgets/bottombar_widget.dart';
// import 'package:flutter_animated_bottom/custom_animated_bottom_bar.dart';

class BottomNav extends StatefulWidget {

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HamsaColors.lightBackground,
        appBar: HamsaAppBar(
          withLogo: true,
          appBarText: Text('Testing bottom nav'),
        ),
        bottomNavigationBar: _buildBottomBar()
    );
  }

  Widget _buildBottomBar() {
    return HamsaBottomBar(
      containerHeight: 75,
      backgroundColor: HamsaColors.lightBackground,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 15,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: HamsaColors.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('FUNDRAISERS'),
          activeColor: HamsaColors.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text(
            'PROFILE ',
          ),
          activeColor: HamsaColors.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}