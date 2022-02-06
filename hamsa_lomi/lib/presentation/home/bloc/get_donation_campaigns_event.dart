part of 'get_donation_campaigns_bloc.dart';

abstract class GetDonationCampaignsEvent extends Equatable {
  const GetDonationCampaignsEvent();
}

class GetDonationCampaignsRequested extends GetDonationCampaignsEvent {
  @override
  List<Object?> get props => [];
}

class DonationCategorySet extends GetDonationCampaignsEvent {
  final DonationCategory category;

  DonationCategorySet(this.category);

  @override
  List<Object?> get props => [category];
}
