import 'package:injectable/injectable.dart';

import '../data_sources/get_donation_campaign_data_source.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/core/entities/hamsa_campaign.dart';
import '../../../domain/core/entities/donation_category.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/get_donation_campaigns/repositories/get_donation_campaign_repository.dart';

@LazySingleton(as: GetDonationCampaignRepository)
class GetDonationCampaignRepositoryImpl
    implements GetDonationCampaignRepository {
  final GetDonationCampaignDataSource _getDonationCampaignDataSource;

  GetDonationCampaignRepositoryImpl(this._getDonationCampaignDataSource);

  @override
  Future<Either<Failure, List<HamsaCampaign>>> getDonationCampaigns(
      DonationCategory category) async {
    return right(
        await _getDonationCampaignDataSource.getDonationCampaigns(category));
  }
}
