// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import '../../../domain/core/entities/entities.dart';
import '../../../injection/injection.dart';
import '../bloc/get_donation_campaigns_bloc.dart';
import 'horizontal_scroll_view.dart';

class EmergencyDonations extends StatelessWidget {
  const EmergencyDonations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetDonationCampaignsBloc>()
        ..add(
          DonationCategorySet(
            DonationCategory.emergency,
          ),
        )
        ..add(GetDonationCampaignsRequested()),
      child: BlocBuilder<GetDonationCampaignsBloc, GetDonationCampaignsState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return HorizontalScrollView(
            label: 'Emergency Donations',
            campaigns: state.campaigns,
          );
        },
      ),
    );
  }
}
