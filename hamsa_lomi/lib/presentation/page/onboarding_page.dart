// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../constants/app_assets_constant.dart';
import '../constants/app_string_constant.dart';
import '../create_account/pages/create_account_page.dart';
import '../lang_acct_type/pages/choose_account_type.dart';
import '../theme/hamsa_theme.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingPage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: [
        BuildIntroContent1(),
        BuildIntroContent2(),
        BuildIntroContent3()
      ],
    );
  }
}

class BuildIntroContent1 extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountType()));
          },
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BuildHeadingText(HamsaStrings.title1),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BuildBodyText(HamsaStrings.body1),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height / 15),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 15.0),
              child: _buildRowCirecleDots(),
            )
          ],
        ),
      ),
    );
  }

  Container _buildRowCirecleDots() {
    return Container(
      child: Row(
        children: [
          BuildCircleDot(active: true),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(active: false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(active: false)
        ],
      ),
    );
  }
}

class BuildIntroContent2 extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountType()));
            },
            child: Text(
              'Skip',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: BuildHeadingText(HamsaStrings.title2),
                ),
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: BuildBodyText(HamsaStrings.body2),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height / 15),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 15.0,
                  ),
                  child: _buildRowCirecleDots(),
                )
              ]),
        ));
  }

  Container _buildRowCirecleDots() {
    return Container(
      child: Row(
        children: [
          BuildCircleDot(active: false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(active: true),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(active: false)
        ],
      ),
    );
  }
}

class BuildIntroContent3 extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BuildHeadingText(HamsaStrings.title3),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BuildBodyText(HamsaStrings.body3),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height / 15),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: _buildRowCirecleDots(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.height / 5.9,
                      child: _startButton(context, HamsaStrings.getStarted),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildRowCirecleDots() {
    return Container(
      child: Row(
        children: [
          BuildCircleDot(active: false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(active: false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(active: true)
        ],
      ),
    );
  }

  // ElevatedButton
  ElevatedButton _startButton(BuildContext context, String text) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAccountPage()));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(HamsaColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))));
  }
}
