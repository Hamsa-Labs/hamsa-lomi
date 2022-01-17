part of 'attachment_upload_bloc.dart';

abstract class AttachmentUploadEvent extends Equatable {
  const AttachmentUploadEvent();
}

class UploadAttachmentRequested extends AttachmentUploadEvent {
  final File file;
  final AttachmentType attachmentType;

  UploadAttachmentRequested({
    required this.file,
    required this.attachmentType,
  });

  @override
  List<Object?> get props => [file, attachmentType];
}

class UploadProgressUpdated extends AttachmentUploadEvent {
  final double progress;

  UploadProgressUpdated(this.progress);

  @override
  List<Object?> get props => [progress];
}

class AttachmentUploadPaused extends AttachmentUploadEvent {
  @override
  List<Object?> get props => [];
}

class AttachmentUploadResumed extends AttachmentUploadEvent {
  @override
  List<Object?> get props => [];
}

class AttachmentUploadCancelled extends AttachmentUploadEvent {
  @override
  List<Object?> get props => [];
}

class RunningStateToggled extends AttachmentUploadEvent {
  @override
  List<Object?> get props => [];
}

class AttachmentUploadFinished extends AttachmentUploadEvent {
  final String downloadUrl;

  AttachmentUploadFinished(this.downloadUrl);

  @override
  List<Object?> get props => [downloadUrl];
}

class AttachmentUploadFailed extends AttachmentUploadEvent {
  final String error;

  AttachmentUploadFailed(this.error);

  @override
  List<Object?> get props => [error];
}
