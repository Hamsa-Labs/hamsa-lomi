import 'package:dartz/dartz.dart';
import '../../core/core.dart';
import '../../core/entities/entities.dart';

abstract class GetDonationCampaignRepository {
  Future<Either<Failure, HamsaCampaign>> getDonationCampaigns(
      DonationCategory category);
}
