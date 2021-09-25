//flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '../../theme/hamsa_theme.dart';
import '../widgets/balance_card.dart';
import '../widgets/image_container.dart';
import '../widgets/settion_container.dart';
import '../widgets/text_button.dart';
// file imports:
import '../../constants/app_assets_constant.dart';
import '../../share_widgets/appbar_widget.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HamsaColors.lightBackground,
      appBar: HamsaAppBar(
        withLeading: false,
        withLogo: false,
        appBarText: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ProfilePage(),

    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1st row for img profile and username
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //image profile
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ImageContainer(imgPath: 'https://googleflutter.com/sample_image.jpg'
                ),
              ),
              // username

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('James Bator\nPersonal Fundraiser'),
                ),
              Padding(padding: const EdgeInsets.all(8.0),
              child:IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  HamsaIcons.editIcon,
                ),
              ),)


              //professional
            ],
          ),
          //2nd row for user bio
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Bio',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffC7C7C7)),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adip iscing elit.'
                ' Lorem ipsum dolor sit amet, consectetur adip iscing elit.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff485550)),
              )
            ]),
          ),

          //3rd row for donation balance card
          BalanceCard(
            content: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //balance Icon
                SvgPicture.asset(
                  HamsaIcons.balanceIcon,
                ),
                //balance digit
                Text(
                  '18,240.00 Birr',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                      fontWeight: FontWeight.w600,
                      color: HamsaColors.lightBackground),
                ),

                //Add payment Icon
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    HamsaIcons.paymentIcon,
                  ),
                ),
              ],
            ),
          ),
          //4th row two tab for my donations and my fundraise
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryTextButton(
                  buttonText: 'My\nDonation',
                ),
                PrimaryTextButton(
                  buttonText: 'My\nFundraisers',
                ),
              ],
            ),
          ),
          //5th row setting functionality
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SettingContainer(
                    containerName: 'Record',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SettingContainer(
                    containerName: 'Language Preference',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SettingContainer(
                    containerName: 'Contact Support',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
