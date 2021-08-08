// Flutter imports:
import 'package:flutter/material.dart';
import 'presentation/page/onboarding_page.dart';

import 'presentation/theme/hamsa_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamsa Lomi',
      theme: HamsaTheme.lightTheme,
      home: OnboardingPage(),
    );
  }
}
