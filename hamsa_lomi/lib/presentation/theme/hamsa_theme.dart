import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/constants/app_assets_constant.dart';

class HamsaTheme extends StatelessWidget {
  final Widget home;
 final String title;

  const HamsaTheme({Key key, this.home, this.title}) : super(key: key); // by default

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: HamsaColors.primaryColor,
        accentColor: HamsaColors.secondaryColor,

        // Define the default font family.
        fontFamily: 'POPPINS',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          //h1,h2
          //
          headline1: TextStyle(fontSize: 24.0,fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Poppins-Regular'),
        ),
      ),
      home: home,
    );
  }
}
