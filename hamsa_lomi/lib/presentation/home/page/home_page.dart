// Flutter imports:
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

// Project imports:

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Home Page'),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
