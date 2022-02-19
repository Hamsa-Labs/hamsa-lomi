part of 'donation_creation_bloc.dart';

class DonationCreationState extends Equatable {
  final String? id;
  final RequiredTextInput title;
  final RequiredTextInput description;
  final RequiredTextInput coverPhoto;
  final RequiredCategoryInput category;
  final RequiredGoalInput goal;
  final RequiredDueDateInput dueDate;
  final ImageGalleryInput imageGallery;
  final String? videoAttachment;
  final String? documentAttachment;

  final FormzStatus status;

  const DonationCreationState({
    this.title = const RequiredTextInput.pure(),
    this.description = const RequiredTextInput.pure(),
    this.category = const RequiredCategoryInput.pure(),
    this.goal = const RequiredGoalInput.pure(),
    this.dueDate = const RequiredDueDateInput.pure(),
    this.imageGallery = const ImageGalleryInput.pure(),
    this.coverPhoto = const RequiredTextInput.pure(),
    this.videoAttachment,
    this.documentAttachment,
    this.id,
    this.status = FormzStatus.pure,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        status,
        category,
        goal,
        dueDate,
        imageGallery,
        videoAttachment,
        documentAttachment,
        coverPhoto
      ];

  DonationCreationState copyWith({
    String? id,
    RequiredTextInput? title,
    RequiredTextInput? description,
    RequiredCategoryInput? category,
    RequiredGoalInput? goal,
    RequiredDueDateInput? dueDate,
    RequiredTextInput? coverPhoto,
    ImageGalleryInput? imageGallery,
    String? documentAttachment,
    String? videoAttachment,
    FormzStatus? status,
  }) {
    return DonationCreationState(
      title: title ?? this.title,
      status: status ?? this.status,
      description: description ?? this.description,
      category: category ?? this.category,
      goal: goal ?? this.goal,
      dueDate: dueDate ?? this.dueDate,
      imageGallery: imageGallery ?? this.imageGallery,
      documentAttachment: documentAttachment ?? this.documentAttachment,
      videoAttachment: videoAttachment ?? this.videoAttachment,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      id: id ?? this.id,
    );
  }
}
