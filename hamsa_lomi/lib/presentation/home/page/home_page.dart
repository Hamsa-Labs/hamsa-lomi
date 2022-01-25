// Flutter imports:
import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

// Project imports:
import '../../donation_creation/donation_creation_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Home Page'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, DonationCreationPage.route());
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
