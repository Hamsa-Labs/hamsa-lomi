// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';
import '../../donation_creation/donation_creation_page.dart';
import '../../widgets/hamsa_rounded_button.dart';

class StartFundraiserButton extends StatelessWidget {
  const StartFundraiserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HamsaColors.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Start a new campaign',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            HamsaRoundedButton(
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              label: 'Start',
              onPressed: () {
                Navigator.push(context, DonationCreationPage.route());
              },
            )
          ],
        ),
      ),
    );
  }
}
