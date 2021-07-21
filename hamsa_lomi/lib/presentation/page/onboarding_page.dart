import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/constants/app_assets_constant.dart';
import 'package:hamsa_lomi/presentation/constants/app_string_constant.dart';
import 'package:hamsa_lomi/presentation/widgets/onboarding_widget.dart';

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

          },
          child: Text(
            'Skip',
            style: TextStyle(color: HamsaColors.darkGreen, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildHeadingText(OnboradingStrings.title1),
            SizedBox(height: 10),
            BuildBodyText(OnboradingStrings.body1),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
          BuildCircleDot(true),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(false)
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

          },
          child: Text(
            'Skip',
            style: TextStyle(color: HamsaColors.darkGreen, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildHeadingText(OnboradingStrings.title2),
            SizedBox(height: 10),
            BuildBodyText(OnboradingStrings.body2),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
          BuildCircleDot(false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(true),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(false)
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildHeadingText(OnboradingStrings.title3),
            SizedBox(height: 10),
            BuildBodyText(OnboradingStrings.body3),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  _buildRowCirecleDots(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/3.5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height/5.9,
                      child: _startButton(OnboradingStrings.getStarted))
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
          BuildCircleDot(false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(false),
          SizedBox(
            width: 35,
          ),
          BuildCircleDot(true)
        ],
      ),
    );
  }
  // ElevatedButton
ElevatedButton _startButton(String text) {
    return ElevatedButton(onPressed: () {},
        child:Text(text,style: TextStyle(fontSize: 15),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(HamsaColors.primaryColor) ,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
            )
        )
    ) );
}
}
