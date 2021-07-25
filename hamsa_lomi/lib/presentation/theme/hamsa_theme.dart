import 'package:flutter/material.dart';
import '../constants/app_assets_constant.dart';


mixin HamsaTheme {

  static ThemeData get lightTheme  {
    var big = true;// default for time been
    var wValue =  5; // by default for time been
    FontWeight weight;
    if (wValue == 6) {
      weight = FontWeight.w600;
    }
    else if (wValue == 5) {
      weight = FontWeight.w500;
    }
    else if (wValue == 4) {
      weight = FontWeight.w400;
    }
    return ThemeData(
      primaryColor: HamsaColors.primaryColor,
      accentColor: HamsaColors.secondaryColor,

      textTheme:TextTheme(
        headline1: big?TextStyle(
            color:HamsaColors.darkGray,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            fontFamily:'Poppins'
        ):TextStyle(
            color:HamsaColors.darkGray,
            fontWeight: FontWeight.w500,
            fontSize: 24,
            fontFamily:'Poppins'
        ),
        headline2: big?TextStyle(
          color:HamsaColors.darkGray,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontFamily: 'Poppins',
        ):TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            fontFamily: 'Poppins'
        ),
        headline3: TextStyle(
          color:HamsaColors.darkGray,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        headline4: TextStyle(
            fontWeight: weight,
            fontSize: 14,
            fontFamily: 'Poppins'
        ),
        bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Poppins'
        ),
        bodyText2: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily: 'Poppins'
        ),
        caption: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
      ),
      fontFamily: 'Poppins',
     );

  }


}