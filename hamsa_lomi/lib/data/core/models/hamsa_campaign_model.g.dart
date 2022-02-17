// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hamsa_campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HamsaCampaignModel _$HamsaCampaignModelFromJson(Map<String, dynamic> json) =>
    HamsaCampaignModel(
      title: json['title'] as String,
      category: $enumDecode(_$DonationCategoryEnumMap, json['category']),
      goal: (json['goal'] as num).toDouble(),
      description: json['description'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      imageGallery: (json['imageGallery'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      coverPhoto: json['coverPhoto'] as String,
      videoAttachment: json['videoAttachment'] as String?,
      amountRaised: (json['amountRaised'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HamsaCampaignModelToJson(HamsaCampaignModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': _$DonationCategoryEnumMap[instance.category],
      'goal': instance.goal,
      'description': instance.description,
      'dueDate': instance.dueDate.toIso8601String(),
      'imageGallery': instance.imageGallery,
      'coverPhoto': instance.coverPhoto,
      'videoAttachment': instance.videoAttachment,
      'id': instance.id,
      'amountRaised': instance.amountRaised,
    };

const _$DonationCategoryEnumMap = {
  DonationCategory.health: 'health',
  DonationCategory.education: 'education',
  DonationCategory.personal: 'personal',
  DonationCategory.charity: 'charity',
  DonationCategory.emergency: 'emergency',
};
