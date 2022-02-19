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
class SaveHamsaCampaignUseCase
    extends BaseUseCase<HamsaCampaign, CreateHamsaCampaign> {
  final DonationCreationRepository _repository;

  SaveHamsaCampaignUseCase(this._repository);
  @override
  Future<Either<Failure, HamsaCampaign>> call(CreateHamsaCampaign param) {
    return _repository.saveHamsaCampaign(param);
  }
}
