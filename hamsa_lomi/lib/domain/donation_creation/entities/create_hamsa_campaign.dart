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
  }) : super(
          title: title,
          category: category,
          goal: goal,
          description: description,
          dueDate: dueDate,
          imageGallery: imageGallery,
        );

  @override
  List<Object?> get props => super.props;
}
