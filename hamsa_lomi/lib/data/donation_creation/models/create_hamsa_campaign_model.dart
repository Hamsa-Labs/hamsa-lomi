// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../domain/core/core.dart';
import '../../../domain/donation_creation/donation_creation.dart';

part 'create_hamsa_campaign_model.g.dart';

@JsonSerializable()
class CreateHamsaCampaignModel extends CreateHamsaCampaign {
  CreateHamsaCampaignModel({
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
    required List<String> imageGallery,
    final String? videoAttachment,
    final String? documentAttachment,
  }) : super(
          category: category,
          description: description,
          dueDate: dueDate,
          goal: goal,
          title: title,
          imageGallery: imageGallery,
          documentAttachment: documentAttachment,
          videoAttachment: videoAttachment,
        );

  static CreateHamsaCampaignModel toModel(CreateHamsaCampaign entity) {
    return CreateHamsaCampaignModel(
      title: entity.title,
      category: entity.category,
      goal: entity.goal,
      description: entity.description,
      dueDate: entity.dueDate,
      imageGallery: entity.imageGallery,
      documentAttachment: entity.documentAttachment,
      videoAttachment: entity.videoAttachment,
    );
  }

  Map<String, dynamic> toJson() => _$CreateHamsaCampaignModelToJson(this);
}
