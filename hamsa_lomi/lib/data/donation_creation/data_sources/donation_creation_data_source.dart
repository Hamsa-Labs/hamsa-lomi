// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/core/core.dart';
import '../../core/models/hamsa_campaign_model.dart';
import '../donation_creation.dart';

abstract class DonationCreationDataSource {
  Future<HamsaCampaign> createHamsaCampaign(CreateHamsaCampaignModel campaign);
}

@LazySingleton(as: DonationCreationDataSource)
class DonationCreationDataSourceImpl implements DonationCreationDataSource {
  CollectionReference hamsaCampaigns =
      FirebaseFirestore.instance.collection('campaigns');

  @override
  Future<HamsaCampaign> createHamsaCampaign(
      CreateHamsaCampaignModel campaign) async {
    final response = await hamsaCampaigns.add(campaign.toJson());
    final document = (await hamsaCampaigns.doc(response.id).get()).data();
    return HamsaCampaignModel.fromJson(
        {...document as Map<String, dynamic>, 'id': response.id});
  }
}
