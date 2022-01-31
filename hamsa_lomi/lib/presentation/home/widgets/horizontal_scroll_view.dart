// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import '../../core/widgets/hamsa_campaign_card.dart';

class HorizontalScrollView extends StatelessWidget {
  final String label;

  const HorizontalScrollView({Key? key, required this.label}) : super(key: key);

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
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              width: width * .85,
              child: HamsaCampaignCard(),
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
