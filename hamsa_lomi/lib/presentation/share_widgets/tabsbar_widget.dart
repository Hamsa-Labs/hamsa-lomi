import 'package:flutter/material.dart';
import '../constants/app_assets_constant.dart';

class HamsaTabBar extends StatefulWidget {
  final TabBarView tab1;
  final TabBarView tab2;
  final String firstText;
  final String secondText;

  const HamsaTabBar(
      {Key? key,
      required this.tab1,
      required this.tab2,
      required this.firstText,
      required this.secondText})
      : super(key: key);

  @override
  _HamsaTabBarState createState() => _HamsaTabBarState();
}

class _HamsaTabBarState extends State<HamsaTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController!.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
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
            controller: _tabController,
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
                text: widget.firstText,
                // child: widget.tab1,
              ),
              Tab(
                text: widget.secondText,
                // child: widget.tab2,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
