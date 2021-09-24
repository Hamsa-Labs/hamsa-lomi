// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../constants/app_assets_constant.dart';

mixin HamsaTheme {
  static ThemeData get lightTheme {
    var big = true; // default for time been

    return ThemeData(
      primaryColor: HamsaColors.primaryColor,
      primarySwatch: HamsaColors.primarySwatch,
      appBarTheme: AppBarTheme(
        backgroundColor: HamsaColors.lightBackground,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(16.0),
      ),
      textTheme: TextTheme(
        headline1: big
            ? TextStyle(
                color: HamsaColors.darkGray,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                fontFamily: 'Poppins')
            : TextStyle(
                color: HamsaColors.darkGray,
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontFamily: 'Poppins'),
        headline2: big
            ? TextStyle(
                color: HamsaColors.darkGray,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'Poppins',
              )
            : TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: 'Poppins'),
        headline3: TextStyle(
          color: HamsaColors.darkGray,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        headline4: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Poppins'),
        bodyText1: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Poppins'),
        bodyText2: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),
        caption: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
      ),
      fontFamily: 'Poppins',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
