// Flutter imports:
import 'package:flutter/material.dart';
import '../../core/hamsa_app_bar.dart';

// Project imports:
import '../widgets/custom_bottom_nav_bar.dart';

// Project imports:

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLeading: false,
        withLogo: false,
        appBarText: Text('Home'),
      ),
      body: Text('Home Page'),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
