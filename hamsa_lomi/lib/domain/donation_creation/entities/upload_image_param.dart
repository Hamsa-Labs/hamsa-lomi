// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:equatable/equatable.dart';

class UploadImageParam extends Equatable {
  final File file;
  final VoidCallback onPause;
  final ValueChanged<double> onRunning;
  final ValueChanged<String> onSuccess;
  final VoidCallback onCanceled;
  final ValueChanged<String> onError;

  UploadImageParam({
    required this.file,
    required this.onPause,
    required this.onRunning,
    required this.onSuccess,
    required this.onCanceled,
    required this.onError,
  });

  @override
  List<Object?> get props =>
      [file, onPause, onRunning, onSuccess, onCanceled, onError];
}
