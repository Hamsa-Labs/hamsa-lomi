import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../domain/core/entities/entities.dart';
import '../../constants/app_assets_constant.dart';

class DonationGoalBar extends StatelessWidget {
  final HamsaCampaign campaign;
  const DonationGoalBar({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final raisedAmountPercentage =
        campaign.amountRaised.toInt() == 0 ? 1 : campaign.amountRaised.toInt();
    final remainingAmountPercentage = campaign.amountRaised.toInt() == 0
        ? 9
        : (campaign.goal - campaign.amountRaised).toInt();
    return Column(
      children: [
        Container(
          height: 24.0,
          decoration: BoxDecoration(
            color: HamsaColors.lightGray,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: raisedAmountPercentage,
                child: Container(
                  width: double.infinity,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: HamsaColors.primaryColor,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 8.0,
                        child: Text(
                          '${campaign.amountRaisedPercentage} %',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: remainingAmountPercentage,
                child: Container(
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              campaign.amountRaised.toString(),
              style: TextStyle(
                color: HamsaColors.darkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              campaign.goal.toString(),
              style: TextStyle(
                color: HamsaColors.darkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
