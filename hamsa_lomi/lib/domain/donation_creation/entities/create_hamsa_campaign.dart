// Project imports:
import '../../core/entities/entities.dart';

class CreateHamsaCampaign extends BaseHamsaCampaign {
  CreateHamsaCampaign({
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
    required List<String> imageGallery,
    required String coverPhoto,
    final String? videoAttachment,
    final String? documentAttachment,
  }) : super(
          title: title,
          category: category,
          goal: goal,
          description: description,
          dueDate: dueDate,
          imageGallery: imageGallery,
          videoAttachment: videoAttachment,
          documentAttachment: documentAttachment,
          coverPhoto: coverPhoto,
        );

  @override
  List<Object?> get props => super.props;
}
