// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Project imports:
import '../../core/entities/hamsa_campaign.dart';
import '../../core/failure.dart';
import '../entities/create_hamsa_campaign.dart';
import '../entities/upload_image_param.dart';

abstract class DonationCreationRepository {
  Future<Either<Failure, HamsaCampaign>> createHamsaCampaign(
      CreateHamsaCampaign campaign);
  Future<UploadTask> uploadImage(UploadImageParam uploadImageParam);
}
