// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import '../../../domain/donation_creation/entities/upload_attachment_param.dart';
import '../../../injection/injection.dart';
import '../../constants/app_assets_constant.dart';
import '../bloc/image_upload/attachment_upload_bloc.dart';

const width = 68;
const height = 56;
final borderRadius = BorderRadius.circular(16);

class ImageUploader extends StatefulWidget {
  final ValueChanged<String> onUploadSuccess;
  final ValueChanged<int> onImageRemove;

  const ImageUploader(
      {Key? key, required this.onUploadSuccess, required this.onImageRemove})
      : super(key: key);

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  final _images = <File>[];
  final maxImages = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._images
            .map(
              (i) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _Image(
                  file: i,
                  onRemove: (value) {
                    final index = _images.indexOf(value);
                    widget.onImageRemove(index);

                    setState(() {
                      _images.remove(value);
                    });
                  },
                  onUploadSuccess: widget.onUploadSuccess,
                ),
              ),
            )
            .toList(),
        if (_images.length < maxImages)
          InkWell(
            onTap: () => _showDialog(context),
            child: Container(
              width: 68,
              height: 56,
              decoration: BoxDecoration(
                color: HamsaColors.primaryColor,
                borderRadius: borderRadius,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (alertContext) => AlertDialog(
        title: Text('Pick Image Source'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () {
              _pickImage(ImageSource.camera);
              Navigator.pop(alertContext);
            },
          ),
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: () {
              _pickImage(ImageSource.gallery);
              Navigator.pop(alertContext);
            },
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void _pickImage(ImageSource imageSource) async {
    final selected = await ImagePicker().pickImage(source: imageSource);
    if (selected != null) {
      final croppedImage =
          await ImageCropper.cropImage(sourcePath: selected.path);
      if (croppedImage != null) {
        setState(() {
          _images.add(croppedImage);
        });
      }
    }
  }
}

class _Image extends StatelessWidget {
  final File file;
  final ValueChanged<File> onRemove;
  final ValueChanged<String> onUploadSuccess;
  const _Image({
    Key? key,
    required this.file,
    required this.onRemove,
    required this.onUploadSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AttachmentUploadBloc>()
        ..add(
          UploadAttachmentRequested(
            file: file,
            attachmentType: AttachmentType.image,
          ),
        ),
      child: BlocConsumer<AttachmentUploadBloc, AttachmentUploadState>(
        listener: (context, state) {
          if (state.uploadStatus == AttachmentUploadStatus.success &&
              state.downloadUrl != null) {
            onUploadSuccess(state.downloadUrl!);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                    ),
                    child: Image.file(
                      file,
                      width: 68,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (state.uploadProgress < 100)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<AttachmentUploadBloc>()
                              .add(RunningStateToggled());
                        },
                        icon: Icon(
                            state.uploadStatus == AttachmentUploadStatus.running
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white),
                      ),
                    ),
                  if (state.uploadProgress < 100)
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        value: state.uploadProgress / 100,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 4),
              InkWell(
                onTap: () {
                  onRemove(file);
                  context
                      .read<AttachmentUploadBloc>()
                      .add(AttachmentUploadCancelled());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: HamsaColors.lightGray,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
