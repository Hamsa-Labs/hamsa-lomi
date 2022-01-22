// Dart imports:
import 'dart:io';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../domain/donation_creation/entities/upload_attachment_param.dart';
import '../../../../domain/donation_creation/use_cases/upload_attachment_use_case.dart';

part 'attachment_upload_event.dart';
part 'attachment_upload_state.dart';

@injectable
class AttachmentUploadBloc
    extends Bloc<AttachmentUploadEvent, AttachmentUploadState> {
  final UploadAttachmentUseCase _uploadImageUseCase;

  UploadTask? _task;

  AttachmentUploadBloc(this._uploadImageUseCase)
      : super(AttachmentUploadState()) {
    on<AttachmentUploadPaused>((event, emit) {
      emit(state.copyWith(uploadStatus: AttachmentUploadStatus.paused));
    });
    on<UploadAttachmentRequested>((event, emit) async {
      _task = await _uploadImageUseCase.call(
        UploadAttachmentParam(
          file: event.file,
          attachmentType: event.attachmentType,
          onPause: () {
            add(AttachmentUploadPaused());
          },
          onRunning: (val) {
            add(UploadProgressUpdated(val));
          },
          onSuccess: (downloadUrl) {
            add(AttachmentUploadFinished(downloadUrl));
          },
          onCanceled: () {
            add(AttachmentUploadCancelled());
          },
          onError: (err) {
            add(AttachmentUploadFailed(err));
          },
        ),
      );
    });
    on<UploadProgressUpdated>((event, emit) async {
      emit(state.copyWith(
          uploadProgress: event.progress,
          uploadStatus: AttachmentUploadStatus.running));
    });
    on<RunningStateToggled>((event, emit) async {
      if (_task == null) {
        return;
      }
      if (state.uploadStatus == AttachmentUploadStatus.running) {
        _task!.pause();
      } else if (state.uploadStatus == AttachmentUploadStatus.paused) {
        _task!.resume();
      }
    });
    on<AttachmentUploadFinished>((event, emit) {
      emit(
        state.copyWith(
          uploadStatus: AttachmentUploadStatus.success,
          downloadUrl: event.downloadUrl,
        ),
      );
    });
    on<AttachmentUploadCancelled>((event, emit) {
      if (_task != null) {
        _task!.cancel();
        emit(state.copyWith(uploadStatus: AttachmentUploadStatus.cancelled));
      }
    });
  }
}
