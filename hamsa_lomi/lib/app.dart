// Flutter imports:
import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/page/onboarding_page.dart';
import 'package:hamsa_lomi/presentation/theme/hamsa_theme.dart';

// Project imports:
import 'presentation/create_account/pages/create_account_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamsa Lomi',
      theme: HamsaTheme.lightTheme,
      home: OnboardingPage(),
    );
  }
}