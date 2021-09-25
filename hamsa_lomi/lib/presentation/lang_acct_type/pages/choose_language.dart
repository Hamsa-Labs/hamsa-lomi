import 'package:flutter/material.dart';
import '../../constants/app_assets_constant.dart';
import '../../constants/app_string_constant.dart';
import '../../theme/hamsa_theme.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool _flag = false;
  var bg = Color(0xffd7d7db);
  var txtColor = Color(0xff898787);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HamsaColors.lightBackground,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
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
            SizedBox(height: 50),
            if (_flag == true)
              _buildTextButton(HamsaStrings.english,
                  HamsaColors.primaryColor, HamsaColors.lightBackground)
            else
              _buildTextButton(HamsaStrings.english, bg, txtColor),
            SizedBox(height: 50),
            if (_flag == false)
              _buildTextButton(HamsaStrings.amharic,
                  HamsaColors.primaryColor, HamsaColors.lightBackground)
            else
              _buildTextButton(HamsaStrings.amharic, bg, txtColor),

          ],
        ),
      ),
    );


  }
  _buildTextButton(String text, Color bg, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        setState(() => _flag = !_flag);
      },
      child: Text(
        text,
        style: TextStyle(color: txtColor),
      ),
      style: ElevatedButton.styleFrom(
          primary: bg,
          elevation: 10,
          fixedSize: Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          )),
    );
  }
}


