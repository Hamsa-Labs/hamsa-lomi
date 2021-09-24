// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';
import '../../constants/app_string_constant.dart';
import '../../theme/hamsa_theme.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HamsaColors.lightBackground,
      child: Padding(
        padding: const EdgeInsets.only(top: 90.0, left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                HamsaStrings.chososeLang,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize:
                        HamsaTheme.lightTheme.textTheme.headline1!.fontSize,
                    fontWeight: FontWeight.normal,
                    color: HamsaColors.primarySwatch.shade900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _buildTextButton(HamsaStrings.amharic, false)),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _buildTextButton(HamsaStrings.english, true)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTextButton(String text, bool isActivity) {
    return Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: isActivity
              ? HamsaColors.primaryColor
              : HamsaColors.lightBackground,
          border: Border.all(
            color:
                isActivity ? HamsaColors.primaryColor : HamsaColors.lightGray,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          child: isActivity
              ? Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: HamsaColors.lightBackground),
                )
              : Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: HamsaColors.primarySwatch.shade900),
                ),
        ));
  }
}
