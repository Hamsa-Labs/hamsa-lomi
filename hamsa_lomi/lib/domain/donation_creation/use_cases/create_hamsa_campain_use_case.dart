// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/entities/entities.dart';
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../entities/create_hamsa_campaign.dart';
import '../repositories/repositories.dart';

@injectable
class CreateHamsaCampaignUseCase
    extends BaseUseCase<HamsaCampaign, CreateHamsaCampaign> {
  final DonationCreationRepository _repository;

  CreateHamsaCampaignUseCase(this._repository);
  @override
  Future<Either<Failure, HamsaCampaign>> call(CreateHamsaCampaign param) {
    return _repository.createHamsaCampaign(param);
  }
}
