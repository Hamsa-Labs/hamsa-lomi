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
    final String? videoAttachment,
    final String? documentAttachment,
    required this.id,
  }) : super(
          title: title,
          category: category,
          goal: goal,
          description: description,
          dueDate: dueDate,
          imageGallery: imageGallery,
          videoAttachment: videoAttachment,
          documentAttachment: documentAttachment,
        );

  @override
  List<Object?> get props => [...super.props, id];

  double get remainingDays {
    return dueDate.difference(DateTime.now()).inHours / 24;
  }
}
