import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../repositories/get_donation_campaign_repository.dart';
import '../../core/entities/entities.dart';
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';

@injectable
class GetDonationCampaignUseCase
    extends BaseUseCase<List<HamsaCampaign>, DonationCategory> {
  final GetDonationCampaignRepository _getDonationCampaignRepository;

  GetDonationCampaignUseCase(this._getDonationCampaignRepository);

  @override
  Future<Either<Failure, List<HamsaCampaign>>> call(DonationCategory param) {
    return _getDonationCampaignRepository.getDonationCampaigns(param);
  }
}
