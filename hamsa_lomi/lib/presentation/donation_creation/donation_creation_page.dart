// Flutter imports:
import 'package:flutter/material.dart';
import '../../domain/core/entities/entities.dart';

// Project imports:
import '../core/widgets/hamsa_app_bar.dart';
import 'widgets/donation_creation_form.dart';

// Project imports:

class DonationCreationPage extends StatelessWidget {
  final HamsaCampaign? campaign;
  const DonationCreationPage({Key? key, this.campaign}) : super(key: key);

  static MaterialPageRoute route({HamsaCampaign? campaign}) {
    return MaterialPageRoute(
      builder: (_) => DonationCreationPage(campaign: campaign),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLeading: true,
        withLogo: false,
        appBarText: Text(
          campaign == null ? 'Start Fundraiser' : 'Edit Fundraiser',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: DonationCreationForm(
        campaign: campaign,
      ),
    );
  }
}
