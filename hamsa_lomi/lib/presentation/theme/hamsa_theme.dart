import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/constants/app_assets_constant.dart';

class HamsaTheme extends StatelessWidget {
 final StatefulWidget home;
 final String title;

  const HamsaTheme({Key key, this.home, this.title}) : super(key: key); // by default

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: HamsaColors.accentColor,
        accentColor: HamsaColors.secondaryColor,

        // Define the default font family.
        fontFamily: 'POPPINS',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'POPPINS'),
        ),
      ),
      home: home,
    );
  }
}
