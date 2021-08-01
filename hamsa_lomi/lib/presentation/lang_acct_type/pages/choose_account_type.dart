import 'package:flutter/material.dart';
import '../../constants/app_assets_constant.dart';
import '../../constants/app_string_constant.dart';
import '../widget/button_widget.dart';
import '../../share_widgets/appbar_widget.dart';
import '../../theme/hamsa_theme.dart';

class AccountType extends StatelessWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HamsaColors.lightBackground,
      appBar: HamsaAppBar(
        withLogo: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              HamsaStrings.chooseAcctType,
              style: HamsaTheme.lightTheme.textTheme.headline1,
            ),
            Column(
              children: [
                _buildTextButton(HamsaStrings.personal, false),
                SizedBox(height: 10),
                Text('or'),
                SizedBox(height: 10),
                _buildTextButton(HamsaStrings.organization, true)
              ],
            ),
            Column(
              children: [
                ButtonWidget(
                  isActive: false,
                  buttonText: HamsaStrings.signup,
                  onPress: () {},
                ),
                SizedBox(height: 20),
                ButtonWidget(
                    isActive: true, buttonText: HamsaStrings.login,
                    onPress: () {})
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildTextButton(String text, bool isActivity) {
    return Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: isActivity?HamsaColors.primaryColor:Color(0xffd7d7db),
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
                  style: TextStyle(color: HamsaColors.lightBackground),
                )
              : Text(
                  text,
                  style: TextStyle(color: Color(0xffC7C7C7)),
                ),
        ));
  }
}
