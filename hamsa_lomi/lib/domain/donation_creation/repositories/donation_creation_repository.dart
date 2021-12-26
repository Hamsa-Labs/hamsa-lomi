// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../core/entities/hamsa_campaign.dart';
import '../../core/failure.dart';
import '../entities/create_hamsa_campaign.dart';

abstract class DonationCreationRepository {
  Future<Either<Failure, HamsaCampaign>> createHamsaCampaign(
      CreateHamsaCampaign campaign);
}
