// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/core/entities/hamsa_campaign.dart';
import '../../../domain/core/failure.dart';
import '../../../domain/donation_creation/donation_creation.dart';
import '../data_sources/data_sources.dart';
import '../donation_creation.dart';

@LazySingleton(as: DonationCreationRepository)
class DonationCreationRepositoryImpl implements DonationCreationRepository {
  final DonationCreationDataSource _dataSource;

  DonationCreationRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, HamsaCampaign>> createHamsaCampaign(
      CreateHamsaCampaign campaign) async {
    final result = await _dataSource
        .createHamsaCampaign(CreateHamsaCampaignModel.toModel(campaign));
    return right(result);
  }
}
