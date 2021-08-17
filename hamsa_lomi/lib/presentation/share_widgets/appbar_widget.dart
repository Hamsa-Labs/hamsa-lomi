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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: HamsaColors.primaryColor,
              // margin: EdgeInsets.only(left: 2,),
              decoration: BoxDecoration(
                border: Border.all(
                  color: HamsaColors.lightGray,
                ),
                // color: HamsaColors.lightGray,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                // color: Colors.transparent,
                // padding: EdgeInsets.zero,
                // constraints: BoxConstraints(maxHeight: 12.0, maxWidth: 12.0),
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
          ),
          actions: [
            withLogo
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      HamsaIcons.hamsaLogo,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight + 10),
    );
  }
}
