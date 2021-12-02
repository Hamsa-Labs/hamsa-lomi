// Project imports:
import 'entities.dart';

class HamsaCampaign extends BaseHamsaCampaign {
  HamsaCampaign({
    required String title,
    required DonationCategory category,
    required double goal,
    required String description,
    required DateTime dueDate,
  }) : super(
          title: title,
          category: category,
          goal: goal,
          description: description,
          dueDate: dueDate,
        );

  @override
  List<Object?> get props => super.props;
}
