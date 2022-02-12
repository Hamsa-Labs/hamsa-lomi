// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../domain/core/entities/entities.dart';

part 'hamsa_campaign_model.g.dart';

@JsonSerializable()
class HamsaCampaignModel extends HamsaCampaign {
  HamsaCampaignModel({
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
    required List<String> imageGallery,
    required String id,
    required String coverPhoto,
    double? amountRaised,
  }) : super(
          title: title,
          category: category,
          goal: goal,
          description: description,
          dueDate: dueDate,
          id: id,
          imageGallery: imageGallery,
          amountRaised: amountRaised ?? 0,
          coverPhoto: coverPhoto,
        );

  factory HamsaCampaignModel.fromJson(Map<String, dynamic> json) =>
      _$HamsaCampaignModelFromJson(json);
}
