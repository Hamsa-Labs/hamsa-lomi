// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../constants/app_assets_constant.dart';
import 'hamsa_text_theme.dart';

mixin HamsaTheme {
  static ThemeData get lightTheme {
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
      textTheme: hamsaTextTheme,
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
