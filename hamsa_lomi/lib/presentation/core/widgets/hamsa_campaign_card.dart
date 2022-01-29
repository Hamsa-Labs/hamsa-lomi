// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';

class HamsaCampaignCard extends StatelessWidget {
  const HamsaCampaignCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 202,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/placeholder.jpg',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
              Positioned(
                top: 16,
                right: 16,
                child: _DaysLeft(),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: _RaisedAmount(),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Facilisis nibh velit porttitor felis'
          'arcu Faci lisis nibh velit porttitor felis arcu ...',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class _DaysLeft extends StatelessWidget {
  const _DaysLeft({Key? key}) : super(key: key);

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
            '90',
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
  const _RaisedAmount({Key? key}) : super(key: key);

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
                  '37.5 K birr',
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
              '5 K',
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
