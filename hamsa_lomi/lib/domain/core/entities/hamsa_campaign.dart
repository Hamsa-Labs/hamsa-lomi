// Project imports:
import 'entities.dart';

class HamsaCampaign extends BaseHamsaCampaign {
  final String id;

  HamsaCampaign({
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
    required List<String> imageGallery,
    required this.id,
  }) : super(
          title: title,
          category: category,
          goal: goal,
          description: description,
          dueDate: dueDate,
          imageGallery: imageGallery,
        );

  @override
  List<Object?> get props => [...super.props, id];
}
