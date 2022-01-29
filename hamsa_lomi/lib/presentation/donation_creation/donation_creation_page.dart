// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../core/widgets/hamsa_app_bar.dart';
import 'widgets/donation_creation_form.dart';

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
        withLeading: true,
        withLogo: false,
        appBarText: Text(
          'Start Fundraiser',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: DonationCreationForm(),
    );
  }
}
