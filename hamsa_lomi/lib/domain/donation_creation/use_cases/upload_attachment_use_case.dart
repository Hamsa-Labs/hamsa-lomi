// Package imports:
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../entities/upload_attachment_param.dart';
import '../repositories/repositories.dart';

@injectable
class UploadAttachmentUseCase {
  final DonationCreationRepository _donationCreationRepository;

  UploadAttachmentUseCase(this._donationCreationRepository);

  Future<UploadTask> call(UploadAttachmentParam param) {
    return _donationCreationRepository.uploadAttachment(param);
  }
}
