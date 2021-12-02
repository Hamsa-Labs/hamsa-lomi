// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../core/entities/entities.dart';
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../entities/create_hamsa_campaign.dart';

class CreateHamsaCampaignUseCase
    extends BaseUseCase<HamsaCampaign, CreateHamsaCampaign> {
  @override
  Future<Either<Failure, HamsaCampaign>> call(CreateHamsaCampaign param) {
    throw UnimplementedError();
  }
}
