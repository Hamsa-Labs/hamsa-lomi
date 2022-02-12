// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../../hamsa_campaign_detail/page/hamsa_campaign_detail_page.dart';

// Project imports:
import '../../../domain/core/entities/entities.dart';
import '../../constants/app_assets_constant.dart';

class HamsaCampaignCard extends StatelessWidget {
  final HamsaCampaign campaign;

  const HamsaCampaignCard({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, HamsaCampaignDetailPage.route(campaign));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 202,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Stack(
              children: [
                Image.network(
                  campaign.coverPhoto,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: _DaysLeft(
                    remainingDays: campaign.remainingDays,
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: _RaisedAmount(
                    campaign: campaign,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            campaign.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class _DaysLeft extends StatelessWidget {
  final double remainingDays;

  const _DaysLeft({Key? key, required this.remainingDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: HamsaColors.lightGray),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Text(
            remainingDays.toString(),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: HamsaColors.lightGrayTextColor,
                ),
          ),
          Text(
            'days',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'left',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

class _RaisedAmount extends StatelessWidget {
  final HamsaCampaign campaign;

  const _RaisedAmount({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: HamsaColors.primaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  '${campaign.amountRaised} ETB',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              padding: EdgeInsets.all(4.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              '${campaign.goal}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: HamsaColors.lightGrayTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
