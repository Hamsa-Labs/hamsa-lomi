part of 'donation_creation_bloc.dart';

abstract class DonationCreationEvent extends Equatable {
  const DonationCreationEvent();
}

class TitleChanged extends DonationCreationEvent {
  final String title;

  TitleChanged({required this.title});

  @override
  List<Object?> get props => [title];
}

class DescriptionChanged extends DonationCreationEvent {
  final String description;

  DescriptionChanged({required this.description});

  @override
  List<Object?> get props => [description];
}

class CategoryChanged extends DonationCreationEvent {
  final DonationCategory category;

  CategoryChanged(this.category);

  @override
  List<Object?> get props => [category];
}

class GoalAmountChanged extends DonationCreationEvent {
  final double goal;

  GoalAmountChanged(this.goal);

  @override
  List<Object?> get props => [goal];
}

class DueDateChanged extends DonationCreationEvent {
  final DateTime dueDate;

  DueDateChanged(this.dueDate);

  @override
  List<Object?> get props => [dueDate];
}

class DonationCreationFormSubmitted extends DonationCreationEvent {
  @override
  List<Object?> get props => [];
}
