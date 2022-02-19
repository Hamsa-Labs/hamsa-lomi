// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

// Project imports:
import '../../../domain/core/core.dart';
import '../../../domain/donation_creation/entities/upload_attachment_param.dart';
import '../../core/models/hamsa_campaign_model.dart';
import '../donation_creation.dart';

abstract class DonationCreationDataSource {
  Future<HamsaCampaign> createHamsaCampaign(CreateHamsaCampaignModel campaign);
  Future<UploadTask> uploadAttachment(UploadAttachmentParam param);

  Future<HamsaCampaign> updateHamsaCampaign(CreateHamsaCampaignModel model);
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
  Future<UploadTask> uploadAttachment(UploadAttachmentParam param) async {
    final task = _getReference(param).putFile(param.file);
    task.snapshotEvents.listen((event) async {
      if (event.state == TaskState.paused) {
        param.onPause();
      } else if (event.state == TaskState.running) {
        final progress = (event.bytesTransferred / event.totalBytes) * 100;
        param.onRunning(progress);
      } else if (event.state == TaskState.success) {
        final downloadUrl = await event.ref.getDownloadURL();
        param.onSuccess(downloadUrl);
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

  Reference _getReference(UploadAttachmentParam param) {
    Reference ref;
    // TODO: Generate unique image file name for each image to be uploaded.
    final fileName = basename(param.file.path);

    switch (param.attachmentType) {
      case AttachmentType.image:
        ref = storage.ref('images/$fileName');
        break;
      case AttachmentType.video:
        ref = storage.ref('videos/$fileName');
        break;
      case AttachmentType.document:
        ref = storage.ref('documents/$fileName');
        break;
    }
    return ref;
  }

  @override
  Future<HamsaCampaign> updateHamsaCampaign(
      CreateHamsaCampaignModel model) async {
    await hamsaCampaigns.doc(model.id).update(model.toJson());
    final data = (await hamsaCampaigns.doc(model.id).get()).data();
    return HamsaCampaignModel.fromJson(data!);
  }
}
