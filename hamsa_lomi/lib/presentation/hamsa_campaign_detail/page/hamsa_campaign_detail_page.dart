import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/hamsa_app_bar.dart';
import '../../../domain/core/entities/entities.dart';
import 'package:share_plus/share_plus.dart';

class HamsaCampaignDetailPage extends StatelessWidget {
  final HamsaCampaign campaign;
  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  static MaterialPageRoute route(HamsaCampaign campaign) {
    return MaterialPageRoute(
      builder: (_) => HamsaCampaignDetailPage(
        campaign: campaign,
      ),
    );
  }

  HamsaCampaignDetailPage({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLogo: false,
        withLeading: true,
        appBarText: Text('Fundraiser'),
        actionButton: IconButton(
          icon: Icon(Icons.share_rounded),
          onPressed: _handleSharing,
        ),
      ),
    );
  }

  void _handleSharing() async {
    final parameters = DynamicLinkParameters(
      uriPrefix: 'https://lomi.page.link',
      link: Uri.parse('https://hamsalomi.com/campaign/${campaign.id}'),
      androidParameters: AndroidParameters(
        packageName: 'org.hamsa.lomi',
      ),
    );

    final uri = await dynamicLinks.buildLink(parameters);

    Share.share(uri.toString());
  }
}
