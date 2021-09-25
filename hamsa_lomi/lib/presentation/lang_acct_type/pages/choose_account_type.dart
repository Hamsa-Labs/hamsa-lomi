// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';
import '../../constants/app_string_constant.dart';
import '../../create_account/pages/create_account_page.dart';
import '../../share_widgets/appbar_widget.dart';
import '../../theme/hamsa_theme.dart';
import '../widget/button_widget.dart';

class AccountType extends StatefulWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  bool _flag = false;
  Color bg = Color(0xffd7d7db);
  Color txtColor = Color(0xff898787);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HamsaColors.lightBackground,
      appBar: HamsaAppBar(
        withLeading: true,
        withLogo: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
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
                if (_flag == true)
                  _buildTextButton(HamsaStrings.personal,
                      HamsaColors.primaryColor, HamsaColors.lightBackground)
                else
                  _buildTextButton(HamsaStrings.personal, bg, txtColor),
                SizedBox(height: 10),
                Text('or'),
                SizedBox(height: 10),
                //which mean that org is selected
                if (_flag == false)
                  _buildTextButton(HamsaStrings.organization,
                      HamsaColors.primaryColor, HamsaColors.lightBackground)
                else
                  _buildTextButton(HamsaStrings.organization, bg, txtColor)
              ],
            ),
            Column(
              children: [
                ButtonWidget(
                  isActive: false,
                  buttonText: HamsaStrings.signup,
                  onPress: () {
                    if (_flag == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccountPage()));
                    } else {}
                  },
                ),
                SizedBox(height: 20),
                ButtonWidget(
                    isActive: true,
                    buttonText: HamsaStrings.login,
                    onPress: () {
                      if (_flag == true) {
                      } else {}
                    })
              ],
            ),
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
