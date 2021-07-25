// Flutter imports:
import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/page/onboarding_page.dart';
import 'package:hamsa_lomi/presentation/theme/hamsa_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HamsaTheme.lightTheme,
      home: OnboardingPage(),
    );
  }
}

