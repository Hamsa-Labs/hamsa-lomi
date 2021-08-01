import 'package:flutter/material.dart';
import '../../constants/app_assets_constant.dart';
import '../../theme/hamsa_theme.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final bool isActive ;
  final VoidCallback onPress;

  const ButtonWidget(
      {Key? key, required this.isActive,
        required this.buttonText, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      // color: Colors.black,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          primary: isActive?HamsaColors.primaryColor:Color(0xffd7d7db),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Text(
          buttonText,
          style: isActive?TextStyle(
            fontSize: HamsaTheme.lightTheme.textTheme.headline4!.fontSize,
              fontWeight:HamsaTheme.lightTheme.textTheme.headline4!.fontWeight,
            color: HamsaColors.lightBackground

          ):TextStyle(
              fontSize: HamsaTheme.lightTheme.textTheme.headline4!.fontSize,
              fontWeight:HamsaTheme.lightTheme.textTheme.headline4!.fontWeight ,
              color: HamsaTheme.lightTheme.textTheme.headline4!.color
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
