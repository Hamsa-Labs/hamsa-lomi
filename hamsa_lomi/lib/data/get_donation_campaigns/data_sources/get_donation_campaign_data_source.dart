import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../core/models/hamsa_campaign_model.dart';
import '../../donation_creation/donation_creation.dart';

import '../../../domain/core/entities/entities.dart';

abstract class GetDonationCampaignDataSource {
  Future<List<HamsaCampaign>> getDonationCampaigns(DonationCategory category);
}

@LazySingleton(as: GetDonationCampaignDataSource)
class GetDonationCampaignDataSourceImpl
    implements GetDonationCampaignDataSource {
  final hamsaCampaigns = FirebaseFirestore.instance.collection('campaigns');

  @override
  Future<List<HamsaCampaign>> getDonationCampaigns(
      DonationCategory category) async {
    final querySnapshot = await hamsaCampaigns
        .where(
          'category',
          isEqualTo: CreateHamsaCampaignModel.donationCategoryToJson(category),
        )
        .get();

    return querySnapshot.docs
        .map((e) => HamsaCampaignModel.fromJson(e.data()))
        .toList();
  }
}
