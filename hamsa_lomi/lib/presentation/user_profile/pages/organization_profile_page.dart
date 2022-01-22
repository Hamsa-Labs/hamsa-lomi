//flutter imports:
import 'package:flutter/material.dart';
import '../../core/hamsa_app_bar.dart';
// file imports:
import '../../constants/app_assets_constant.dart';

class OrganizationProfile extends StatefulWidget {
  const OrganizationProfile({Key? key}) : super(key: key);

  @override
  _OrganizationProfileState createState() => _OrganizationProfileState();
}

class _OrganizationProfileState extends State<OrganizationProfile> {
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
    );
  }
}
