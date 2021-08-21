// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../share_widgets/appbar_widget.dart';
import '../../share_widgets/tabsbar_widget.dart';
import '../widgets/sign_in_with_email_form.dart';
import '../widgets/sign_in_with_phone_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HamsaAppBar(
        withLogo: true,
        appBarText: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Enter your credentials',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              HamsaTabBar(
                firstText: 'Email',
                secondText: 'Phone',
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      SignInWithEmailForm(),
                      SignInWithPhoneForm(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
