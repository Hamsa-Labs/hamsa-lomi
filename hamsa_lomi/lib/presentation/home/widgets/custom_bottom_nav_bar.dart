import 'package:flutter/material.dart';
import '../../constants/app_assets_constant.dart';
import '../../core/hamsa_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return HamsaBottomBar(
      containerHeight: 48,
      backgroundColor: HamsaColors.lightBackground,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 15,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavBarItem>[
        BottomNavBarItem(
          icon: Icon(Icons.home),
          title: Text('HOME'),
          activeColor: HamsaColors.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavBarItem(
          icon: Icon(Icons.apps),
          title: Text('FUNDRAISERS'),
          activeColor: HamsaColors.primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavBarItem(
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
