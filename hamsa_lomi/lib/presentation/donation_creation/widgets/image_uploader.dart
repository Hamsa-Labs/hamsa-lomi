// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';

const width = 68;
const height = 56;
final borderRadius = BorderRadius.circular(16);

class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  final _images = <File>[];
  final maxImages = 4;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDialog(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._images
              .map(
                (i) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _Image(
                    file: i,
                    onRemove: (value) {
                      setState(() {
                        _images.remove(value);
                      });
                    },
                  ),
                ),
              )
              .toList(),
          if (_images.length < maxImages)
            Container(
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
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Pick Image Source'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () => _pickImage(ImageSource.camera),
          ),
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: () => _pickImage(ImageSource.gallery),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void _pickImage(ImageSource imageSource) async {
    Navigator.pop(context);

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
  const _Image({Key? key, required this.file, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 4),
        InkWell(
          onTap: () {
            onRemove(file);
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
  }
}
