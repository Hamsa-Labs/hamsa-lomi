part of 'image_upload_bloc.dart';

enum ImageUploadStatus { initial, paused, running, cancelled, success, error }

class ImageUploadState extends Equatable {
  final double uploadProgress;
  final ImageUploadStatus uploadStatus;
  final String? error;

  final String? downloadUrl;

  const ImageUploadState(
      {this.uploadProgress = 0,
      this.uploadStatus = ImageUploadStatus.initial,
      this.error,
      this.downloadUrl});

  @override
  List<Object?> get props => [uploadProgress, uploadStatus, error, downloadUrl];

  ImageUploadState copyWith(
      {double? uploadProgress,
      ImageUploadStatus? uploadStatus,
      String? error,
      String? downloadUrl}) {
    return ImageUploadState(
        uploadProgress: uploadProgress ?? this.uploadProgress,
        uploadStatus: uploadStatus ?? this.uploadStatus,
        error: error ?? this.error,
        downloadUrl: downloadUrl ?? this.downloadUrl);
  }
}
