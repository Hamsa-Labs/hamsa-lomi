// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../core/widgets/tabsbar_widget.dart';

import '../../core/widgets/hamsa_app_bar.dart';

import '../widgets/sign_in_with_email_form.dart';
import '../widgets/sign_in_with_phone_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HamsaAppBar(
        withLeading: true,
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
              Text(
                'Choose your login method',
                style: Theme.of(context).textTheme.caption,
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
