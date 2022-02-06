part of 'get_donation_campaigns_bloc.dart';

class GetDonationCampaignsState extends Equatable {
  final DonationCategory? category;
  final String? errorMessage;
  final List<HamsaCampaign> campaigns;
  final FormzStatus status;

  const GetDonationCampaignsState({
    this.campaigns = const [],
    this.status = FormzStatus.pure,
    this.category,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        campaigns,
        status,
        category,
        errorMessage,
      ];

  GetDonationCampaignsState copyWith(
      {FormzStatus? status,
      DonationCategory? category,
      List<HamsaCampaign>? campaigns,
      String? errorMessage}) {
    return GetDonationCampaignsState(
      status: status ?? this.status,
      campaigns: campaigns ?? this.campaigns,
      category: category ?? this.category,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
