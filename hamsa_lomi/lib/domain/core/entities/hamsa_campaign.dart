// Project imports:
import 'entities.dart';

class HamsaCampaign extends BaseHamsaCampaign {
  final String id;
  final double amountRaised;

  HamsaCampaign({
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
    required List<String> imageGallery,
    required String coverPhoto,
    final String? videoAttachment,
    final String? documentAttachment,
    required this.id,
    required this.amountRaised,
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
  List<Object?> get props => [...super.props, id, amountRaised];

  double get remainingDays {
    return (dueDate.difference(DateTime.now()).inHours / 24).floorToDouble();
  }

  int get amountRaisedPercentage {
    return ((amountRaised / goal) * 100).toInt();
  }
}
