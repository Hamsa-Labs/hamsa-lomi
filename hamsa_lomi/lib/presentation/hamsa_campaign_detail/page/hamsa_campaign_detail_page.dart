import 'package:flutter/material.dart';
import '../../core/widgets/hamsa_app_bar.dart';
import '../../../domain/core/entities/entities.dart';

class HamsaCampaignDetailPage extends StatelessWidget {
  final HamsaCampaign campaign;

  static MaterialPageRoute route(HamsaCampaign campaign) {
    return MaterialPageRoute(
      builder: (_) => HamsaCampaignDetailPage(
        campaign: campaign,
      ),
    );
  }

  const HamsaCampaignDetailPage({Key? key, required this.campaign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLogo: false,
        withLeading: true,
        appBarText: Text('Fundraiser'),
        actionButton: IconButton(
          icon: Icon(Icons.share_rounded),
          onPressed: () {},
        ),
      ),
    );
  }
}
