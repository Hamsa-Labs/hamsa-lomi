// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/core/core.dart';
import '../../../domain/donation_creation/entities/upload_image_param.dart';
import '../../core/models/hamsa_campaign_model.dart';
import '../donation_creation.dart';

abstract class DonationCreationDataSource {
  Future<HamsaCampaign> createHamsaCampaign(CreateHamsaCampaignModel campaign);
  Future<UploadTask> uploadImage(UploadImageParam param);
}

@LazySingleton(as: DonationCreationDataSource)
class DonationCreationDataSourceImpl implements DonationCreationDataSource {
  final hamsaCampaigns = FirebaseFirestore.instance.collection('campaigns');
  final storage = FirebaseStorage.instance;

  @override
  Future<HamsaCampaign> createHamsaCampaign(
      CreateHamsaCampaignModel campaign) async {
    final response = await hamsaCampaigns.add(campaign.toJson());
    final document = (await hamsaCampaigns.doc(response.id).get()).data();
    return HamsaCampaignModel.fromJson(
        {...document as Map<String, dynamic>, 'id': response.id});
  }

  @override
  Future<UploadTask> uploadImage(UploadImageParam param) async {
    final task = storage.ref('uploads/image.jpg').putFile(param.file);
    task.snapshotEvents.listen((event) {
      if (event.state == TaskState.paused) {
        param.onPause();
      } else if (event.state == TaskState.running) {
        final progress = (event.bytesTransferred / event.totalBytes) * 100;
        param.onRunning(progress);
      } else if (event.state == TaskState.success) {
        param.onSuccess();
      } else if (event.state == TaskState.canceled) {
        param.onCanceled();
      }
    }, onError: (e) {
      if (e.code == 'permission-denied') {
        param.onError('User does not have permission to upload.');
      }
    });
    return task;
  }
}
