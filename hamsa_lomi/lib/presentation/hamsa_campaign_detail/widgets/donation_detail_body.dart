import 'package:flutter/material.dart';
import 'donation_goal_bar.dart';
import '../../../domain/core/entities/entities.dart';

class DonationDetailBody extends StatelessWidget {
  final HamsaCampaign campaign;
  const DonationDetailBody({Key? key, required this.campaign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CoverPhoto(
            coverPhoto: campaign.coverPhoto,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            campaign.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 8,
          ),
          // TODO: Display the creator of the campaign
          Placeholder(
            fallbackHeight: 32,
          ),
          SizedBox(
            height: 8,
          ),
          _DonationDetailBodyItem(
            label: 'Donation Goal',
            child: DonationGoalBar(campaign: campaign),
          ),
          _DonationDetailBodyItem(
            label: 'Description',
            child: Text(campaign.description),
          ),
          _DonationDetailBodyItem(
            label: 'Attachment',
            // TODO: Display attachment
            child: Placeholder(
              fallbackHeight: 16,
            ),
          ),
          _DonationDetailBodyItem(
            label: 'Gallery',
            // TODO: Display gallery photos
            child: Placeholder(
              fallbackHeight: 16,
            ),
          ),
          _DonationDetailBodyItem(
            label: 'Participants',
            // TODO: Display participants
            child: Placeholder(
              fallbackHeight: 16,
            ),
          ),
          _DonationDetailBodyItem(
            label: 'Comments',
            // TODO: Display comments
            child: Placeholder(
              fallbackHeight: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _CoverPhoto extends StatelessWidget {
  final String coverPhoto;
  const _CoverPhoto({Key? key, required this.coverPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Image.network(
        coverPhoto,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _DonationDetailBodyItem extends StatelessWidget {
  final String label;
  final Widget child;
  const _DonationDetailBodyItem(
      {Key? key, required this.label, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        child,
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
