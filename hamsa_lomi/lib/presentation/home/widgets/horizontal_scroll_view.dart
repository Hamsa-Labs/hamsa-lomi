// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../domain/core/entities/entities.dart';

// Project imports:
import '../../core/widgets/hamsa_campaign_card.dart';

class HorizontalScrollView extends StatelessWidget {
  final String label;
  final List<HamsaCampaign> campaigns;

  const HorizontalScrollView(
      {Key? key, required this.label, required this.campaigns})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View All'),
            ),
          ],
        ),
        Container(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: campaigns.length,
            itemBuilder: (context, index) => Container(
              width: width * .85,
              child: HamsaCampaignCard(
                campaign: campaigns[index],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 8.0,
            ),
          ),
        ),
      ],
    );
  }
}
