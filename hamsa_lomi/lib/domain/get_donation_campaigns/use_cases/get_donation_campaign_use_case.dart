import 'package:dartz/dartz.dart';
import '../repositories/get_donation_campaign_repository.dart';
import '../../core/entities/entities.dart';
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';

class GetDonationCampaignUseCase
    extends BaseUseCase<HamsaCampaign, DonationCategory> {
  final GetDonationCampaignRepository _getDonationCampaignRepository;

  GetDonationCampaignUseCase(this._getDonationCampaignRepository);

  @override
  Future<Either<Failure, HamsaCampaign>> call(DonationCategory param) {
    throw _getDonationCampaignRepository.getDonationCampaigns(param);
  }
}
