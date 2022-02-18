// Project imports:
import 'entities.dart';

class HamsaCampaign extends BaseHamsaCampaign {
  final double amountRaised;

  HamsaCampaign({
    required String id,
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
    required List<String> imageGallery,
    required String coverPhoto,
    final String? videoAttachment,
    final String? documentAttachment,
    required this.amountRaised,
  }) : super(
          id: id,
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
  List<Object?> get props => [...super.props, amountRaised];

  double get remainingDays {
    return (dueDate.difference(DateTime.now()).inHours / 24).floorToDouble();
  }

  int get amountRaisedPercentage {
    return ((amountRaised / goal) * 100).toInt();
  }
}
