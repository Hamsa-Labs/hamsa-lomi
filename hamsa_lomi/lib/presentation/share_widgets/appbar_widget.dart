// in here we have hamsa lomi appbar widget

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../constants/app_assets_constant.dart';

class HamsaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withLogo;
  final Text? appBarText;

  const HamsaAppBar({
    this.appBarText,
    required this.withLogo,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: AppBar(
          centerTitle: false,
          backgroundColor: HamsaColors.lightBackground,
          title: appBarText,
          leading: Container(
            // color: HamsaColors.primaryColor,
            padding: EdgeInsets.only(top: 5),
            // margin: EdgeInsets.only(left: 2,),
            decoration: BoxDecoration(
              border: Border.all(
                color: HamsaColors.lightGray,
              ),
              // color: HamsaColors.lightGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: IconButton(
              // color: Colors.transparent,
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          actions: [
            withLogo
                ? Container(
                    child: SvgPicture.asset(
                    HamsaIcons.hamsaLogo,
                  ))
                : Container(),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight + 10),
    );
  }
}
