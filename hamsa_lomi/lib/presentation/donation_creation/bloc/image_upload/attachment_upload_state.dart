part of 'attachment_upload_bloc.dart';

enum AttachmentUploadStatus {
  initial,
  paused,
  running,
  cancelled,
  success,
  error
}

class AttachmentUploadState extends Equatable {
  final double uploadProgress;
  final AttachmentUploadStatus uploadStatus;
  final String? error;

  final String? downloadUrl;

  const AttachmentUploadState(
      {this.uploadProgress = 0,
      this.uploadStatus = AttachmentUploadStatus.initial,
      this.error,
      this.downloadUrl});

  @override
  List<Object?> get props => [uploadProgress, uploadStatus, error, downloadUrl];

  AttachmentUploadState copyWith(
      {double? uploadProgress,
      AttachmentUploadStatus? uploadStatus,
      String? error,
      String? downloadUrl}) {
    return AttachmentUploadState(
        uploadProgress: uploadProgress ?? this.uploadProgress,
        uploadStatus: uploadStatus ?? this.uploadStatus,
        error: error ?? this.error,
        downloadUrl: downloadUrl ?? this.downloadUrl);
  }
}
