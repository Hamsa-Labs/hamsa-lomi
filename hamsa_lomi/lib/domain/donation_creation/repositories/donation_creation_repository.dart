// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Project imports:
import '../../core/entities/hamsa_campaign.dart';
import '../../core/failure.dart';
import '../entities/create_hamsa_campaign.dart';
import '../entities/upload_attachment_param.dart';

abstract class DonationCreationRepository {
  Future<Either<Failure, HamsaCampaign>> saveHamsaCampaign(
      CreateHamsaCampaign campaign);
  Future<UploadTask> uploadAttachment(UploadAttachmentParam uploadImageParam);
}
