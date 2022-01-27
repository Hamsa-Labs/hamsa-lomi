// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';

class FundraiserFilter extends StatelessWidget {
  const FundraiserFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FilteringOption(
          label: 'Health',
          child: SvgPicture.asset(HamsaIcons.healthIcon),
        ),
        _FilteringOption(
          label: 'Education',
          child: SvgPicture.asset(HamsaIcons.educationIcon),
        ),
        _FilteringOption(
          label: 'Charity',
          child: SvgPicture.asset(HamsaIcons.charityIcon),
        ),
        // TODO: Change color for this option
        // change color to cyan
        _FilteringOption(
          label: 'More',
          child: SvgPicture.asset(
            // TODO: More Icon isn't working properly.
            // Asset for whatever reason is not being found.
            HamsaIcons.moreIcon,
          ),
        ),
      ],
    );
  }
}

class _FilteringOption extends StatelessWidget {
  final String label;
  final Widget child;

  const _FilteringOption({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: HamsaColors.lightBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
        Text(label),
      ],
    );
  }
}
