// in here we have hamsa lomi appbar widget

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';

class HamsaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withLogo;
  final bool withLeading;
  final Text? appBarText;
  final List<Widget>? actions;

  const HamsaAppBar({
    this.appBarText,
    required this.withLogo,
    required this.withLeading,
    this.actions,
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
          automaticallyImplyLeading: false,
          leading: withLeading
              ? _OutlinedIconButton(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  ),
                )
              : null,
          actions: withLogo
              ? [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      HamsaIcons.hamsaLogo,
                    ),
                  )
                ]
              : actions?.map((e) => _OutlinedIconButton(child: e)).toList() ??
                  null,
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight),
    );
  }
}

class _OutlinedIconButton extends StatelessWidget {
  final Widget child;
  const _OutlinedIconButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: HamsaColors.lightGray,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: child,
      ),
    );
  }
}
