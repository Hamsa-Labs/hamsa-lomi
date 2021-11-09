// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../core/hamsa_app_bar.dart';

// Project imports:

class DonationCreationPage extends StatelessWidget {
  const DonationCreationPage({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(builder: (_) => DonationCreationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLogo: false,
        appBarText: Text(
          'Start Fundraiser',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Text('Donation Creation Page'),
    );
  }
}
