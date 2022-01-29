// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';

class HamsaTabBar extends StatelessWidget {
  final String firstText;
  final String secondText;

  const HamsaTabBar({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: HamsaColors.primaryColor,
            ),
            labelColor: HamsaColors.lightBackground,
            unselectedLabelColor: Color(0xffC7C7C7),
            tabs: [
              Tab(
                text: firstText,
              ),
              Tab(
                text: secondText,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
