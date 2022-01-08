part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();
}

class UploadImageRequested extends ImageUploadEvent {
  final File file;

  UploadImageRequested(this.file);

  @override
  List<Object?> get props => [file];
}

class UploadProgressUpdated extends ImageUploadEvent {
  final double progress;

  UploadProgressUpdated(this.progress);

  @override
  List<Object?> get props => [progress];
}

class ImageUploadPaused extends ImageUploadEvent {
  @override
  List<Object?> get props => [];
}

class ImageUploadResumed extends ImageUploadEvent {
  @override
  List<Object?> get props => [];
}

class ImageUploadCancelled extends ImageUploadEvent {
  @override
  List<Object?> get props => [];
}

class RunningStateToggled extends ImageUploadEvent {
  @override
  List<Object?> get props => [];
}

class ImageUploadFinished extends ImageUploadEvent {
  final String downloadUrl;

  ImageUploadFinished(this.downloadUrl);

  @override
  List<Object?> get props => [downloadUrl];
}

class ImageUploadFailed extends ImageUploadEvent {
  final String error;

  ImageUploadFailed(this.error);

  @override
  List<Object?> get props => [error];
}
