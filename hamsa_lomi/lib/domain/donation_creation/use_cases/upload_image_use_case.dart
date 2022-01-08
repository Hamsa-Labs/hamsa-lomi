// Package imports:
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../entities/upload_image_param.dart';
import '../repositories/repositories.dart';

@injectable
class UploadImageUseCase {
  final DonationCreationRepository _donationCreationRepository;

  UploadImageUseCase(this._donationCreationRepository);

  Future<UploadTask> call(UploadImageParam param) {
    return _donationCreationRepository.uploadImage(param);
  }
}
