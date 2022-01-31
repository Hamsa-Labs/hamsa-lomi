// Flutter imports:
import 'package:flutter/material.dart';
import '../widgets/horizontal_scroll_view.dart';

// Project imports:
import '../../core/widgets/hamsa_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/fundraising_filter.dart';
import '../widgets/start_fundraiser_button.dart';

// Project imports:

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLeading: false,
        withLogo: false,
        appBarText: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: StartFundraiserButton(),
            ),
            SliverPadding(
              padding: EdgeInsets.all(8.0),
            ),
            SliverToBoxAdapter(
              child: FundraiserFilter(),
            ),
            SliverToBoxAdapter(
              child: HorizontalScrollView(label: 'Emergency Donations'),
            ),
            SliverPadding(padding: EdgeInsets.all(4.0)),
            SliverToBoxAdapter(
              child: HorizontalScrollView(label: 'Recent Fundraisers'),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
