// in here we have hamsa lomi appbar widget

import 'package:flutter/material.dart';
import '../constants/app_assets_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HamsaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? appBarText;
  final bool withLogo;
  const HamsaAppBar({
    required this.withLogo,
    this.appBarText,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return withLogo
        ? PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: AppBar(
                backgroundColor: HamsaColors.lightBackground,
                title: appBarText,
                leading: Container(
                  padding: EdgeInsets.only(top: 5),
                  // margin: EdgeInsets.only(left: 2,),
                  decoration: BoxDecoration(
                    color: HamsaColors.lightGray,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                ),
                actions: [
                  Container(

                    padding: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(HamsaIcons.hamsaLogo,
                        allowDrawingOutsideViewBox: true),
                  )
                ],
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 10))
        : PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: AppBar(
                backgroundColor: HamsaColors.lightBackground,
                title: appBarText,
                leading: Container(
                  decoration: BoxDecoration(
                    color: HamsaColors.lightGray,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 10));
  }
}
