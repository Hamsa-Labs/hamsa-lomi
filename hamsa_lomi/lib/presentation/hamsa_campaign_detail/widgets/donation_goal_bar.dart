import 'package:flutter/material.dart';
import '../../../domain/core/entities/entities.dart';
import '../../constants/app_assets_constant.dart';

class DonationGoalBar extends StatelessWidget {
  final HamsaCampaign campaign;
  const DonationGoalBar({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 8.0,
          decoration: BoxDecoration(
            color: HamsaColors.lightGray,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: Row(
            children: [
              Container(),
              Container(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(campaign.amountRaised.toString()),
            Text(campaign.goal.toString()),
          ],
        )
      ],
    );
  }
}
