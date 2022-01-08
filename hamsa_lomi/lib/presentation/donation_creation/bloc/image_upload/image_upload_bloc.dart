// Dart imports:
import 'dart:io';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../domain/donation_creation/entities/upload_image_param.dart';
import '../../../../domain/donation_creation/use_cases/upload_image_use_case.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

@injectable
class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final UploadImageUseCase _uploadImageUseCase;

  UploadTask? _task;

  ImageUploadBloc(this._uploadImageUseCase) : super(ImageUploadState()) {
    on<ImageUploadPaused>((event, emit) {
      emit(state.copyWith(uploadStatus: ImageUploadStatus.paused));
    });
    on<UploadImageRequested>((event, emit) async {
      _task = await _uploadImageUseCase.call(
        UploadImageParam(
          file: event.file,
          onPause: () {
            add(ImageUploadPaused());
          },
          onRunning: (val) {
            add(UploadProgressUpdated(val));
          },
          onSuccess: (downloadUrl) {
            add(ImageUploadFinished(downloadUrl));
          },
          onCanceled: () {
            add(ImageUploadCancelled());
          },
          onError: (err) {
            add(ImageUploadFailed(err));
          },
        ),
      );
    });
    on<UploadProgressUpdated>((event, emit) async {
      emit(state.copyWith(
          uploadProgress: event.progress,
          uploadStatus: ImageUploadStatus.running));
    });
    on<RunningStateToggled>((event, emit) async {
      if (_task == null) {
        return;
      }
      if (state.uploadStatus == ImageUploadStatus.running) {
        _task!.pause();
      } else if (state.uploadStatus == ImageUploadStatus.paused) {
        _task!.resume();
      }
    });
    on<ImageUploadFinished>((event, emit) {
      emit(
        state.copyWith(
          uploadStatus: ImageUploadStatus.success,
          downloadUrl: event.downloadUrl,
        ),
      );
    });
    on<ImageUploadCancelled>((event, emit) {
      if (_task != null) {
        _task!.cancel();
        emit(state.copyWith(uploadStatus: ImageUploadStatus.cancelled));
      }
    });
  }
}
