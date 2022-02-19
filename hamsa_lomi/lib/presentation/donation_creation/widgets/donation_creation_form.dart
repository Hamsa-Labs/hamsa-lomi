// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../bloc/donation_creation/donation_creation_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../../domain/core/core.dart';
import '../../../domain/donation_creation/entities/upload_attachment_param.dart';
import '../../../injection/injection.dart';
import '../../constants/app_assets_constant.dart';
import '../bloc/image_upload/attachment_upload_bloc.dart';
import 'creation_form_field.dart';
import 'image_uploader.dart';

class DonationCreationForm extends StatefulWidget {
  final HamsaCampaign? campaign;
  const DonationCreationForm({
    Key? key,
    this.campaign,
  }) : super(key: key);

  @override
  State<DonationCreationForm> createState() => _DonationCreationFormState();
}

class _DonationCreationFormState extends State<DonationCreationForm> {
  final _bloc = getIt<DonationCreationBloc>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _goalController = TextEditingController();
  final _videoInputController = TextEditingController();
  final _documentAttachmentController = TextEditingController();
  String? _initialCoverPhoto;
  DonationCategory? _initialDonationCategory;
  DateTime? _initialDueDate;
  List<String>? _initialImageGallery;

  @override
  void initState() {
    super.initState();
    if (widget.campaign != null) {
      _initializeFormFields();
    }
  }

  void _initializeFormFields() {
    _bloc.add(IdSet(widget.campaign!.id));

    _titleController.text = widget.campaign!.title;
    _bloc.add(TitleChanged(title: widget.campaign!.title));

    _descriptionController.text = widget.campaign!.description;
    _bloc.add(DescriptionChanged(description: widget.campaign!.description));

    _videoInputController.text = widget.campaign!.videoAttachment ?? '';
    _bloc.add(VideoAttachmentModified(widget.campaign!.videoAttachment));

    _documentAttachmentController.text =
        widget.campaign!.documentAttachment ?? '';
    _bloc.add(DocumentAttachmentModified(widget.campaign!.documentAttachment));

    _initialCoverPhoto = widget.campaign!.coverPhoto;
    _bloc.add(CoverPhotoModified(widget.campaign!.coverPhoto));

    _initialDonationCategory = widget.campaign!.category;
    _bloc.add(CategoryChanged(widget.campaign!.category));

    _goalController.text = widget.campaign!.goal.toString();
    _bloc.add(GoalAmountChanged(widget.campaign!.goal));

    _initialDueDate = widget.campaign!.dueDate;
    _bloc.add(DueDateChanged(widget.campaign!.dueDate));

    _initialImageGallery = widget.campaign!.imageGallery;
    for (var downloadUrl in widget.campaign!.imageGallery) {
      _bloc.add(ImageGalleryUpdated(downloadUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => _bloc,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.campaign == null
                    ? 'Enter The Following Details'
                    : 'Update The Following Details',
                style: Theme.of(context).textTheme.headline5,
              ),
              _TitleInput(
                controller: _titleController,
              ),
              _CoverPhotoInput(
                initialCoverPhoto: _initialCoverPhoto,
              ),
              _CategoryInput(
                initialDonationCategory: _initialDonationCategory,
              ),
              _GoalInput(
                controller: _goalController,
              ),
              _DescriptionInput(
                controller: _descriptionController,
              ),
              _DueDateInput(
                initialValue: _initialDueDate,
              ),
              _GalleryInput(
                initialImages: _initialImageGallery,
              ),
              _AddVideoInput(
                controller: _videoInputController,
              ),
              _AddDocumentInput(
                controller: _documentAttachmentController,
              ),
              Center(
                child: _SubmitFormButton(
                  label: widget.campaign == null ? 'Start' : 'Update',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  final TextEditingController controller;
  const _TitleInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return CreationFormField(
          label: 'Title',
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            controller: controller,
            onChanged: (title) {
              context
                  .read<DonationCreationBloc>()
                  .add(TitleChanged(title: title));
            },
          ),
        );
      },
    );
  }
}

class _CategoryInput extends StatelessWidget {
  final DonationCategory? initialDonationCategory;
  final List<Map<String, dynamic>> _categories = const [
    {'value': DonationCategory.emergency, 'display': 'Emergency'},
    {'value': DonationCategory.health, 'display': 'Health'},
    {'value': DonationCategory.education, 'display': 'Education'},
    {'value': DonationCategory.personal, 'display': 'Personal'},
    {'value': DonationCategory.charity, 'display': 'Charity'},
  ];

  const _CategoryInput({Key? key, this.initialDonationCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return CreationFormField(
            label: 'Category',
            child: DropdownButtonFormField<DonationCategory>(
              items: _categories.map((category) {
                return DropdownMenuItem<DonationCategory>(
                  value: category['value'],
                  child: Text(category['display']),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onChanged: (newValue) {
                context
                    .read<DonationCreationBloc>()
                    .add(CategoryChanged(newValue as DonationCategory));
              },
              value: initialDonationCategory,
            ));
      },
    );
  }
}

class _GoalInput extends StatelessWidget {
  final TextEditingController controller;

  const _GoalInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return CreationFormField(
          label: 'Goal',
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              suffixText: 'ETB',
              suffixStyle: TextStyle(
                color: HamsaColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(),
            onChanged: (amount) {
              context
                  .read<DonationCreationBloc>()
                  .add(GoalAmountChanged(double.parse(amount)));
            },
          ),
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  final TextEditingController controller;
  const _DescriptionInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return CreationFormField(
          label: 'Description',
          child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              minLines: 3,
              maxLines: 5,
              controller: controller,
              onChanged: (description) {
                context
                    .read<DonationCreationBloc>()
                    .add(DescriptionChanged(description: description));
              }),
        );
      },
    );
  }
}

class _DueDateInput extends StatelessWidget {
  final DateTime? initialValue;
  const _DueDateInput({Key? key, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return CreationFormField(
          label: 'Due Date',
          child: DateTimeField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              suffixIcon: Icon(
                Icons.calendar_today,
                color: HamsaColors.primaryColor,
              ),
            ),
            format: DateFormat('yyyy-MM-dd'),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),
              );
            },
            initialValue: initialValue,
            onChanged: (dueDate) {
              if (dueDate != null) {
                context
                    .read<DonationCreationBloc>()
                    .add(DueDateChanged(dueDate));
              }
            },
          ),
        );
      },
    );
  }
}

class _GalleryInput extends StatelessWidget {
  final List<String>? initialImages;

  const _GalleryInput({Key? key, this.initialImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return CreationFormField(
          label: 'Add Gallery',
          child: ImageUploader(
            onUploadSuccess: (value) {
              context
                  .read<DonationCreationBloc>()
                  .add(ImageGalleryUpdated(value));
            },
            onImageRemove: (index) {
              context.read<DonationCreationBloc>().add(ImageRemoved(index));
            },
            initialImages: initialImages ?? [],
          ),
        );
      },
    );
  }
}

class _AddVideoInput extends StatefulWidget {
  final TextEditingController controller;

  const _AddVideoInput({Key? key, required this.controller}) : super(key: key);

  @override
  State<_AddVideoInput> createState() => _AddVideoInputState();
}

class _AddVideoInputState extends State<_AddVideoInput> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AttachmentUploadBloc>(),
      child: BlocConsumer<AttachmentUploadBloc, AttachmentUploadState>(
        listener: (context, state) {
          if (state.uploadStatus == AttachmentUploadStatus.error &&
              state.error != null) {
            final snackBar = SnackBar(
              content: Text(state.error!),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.uploadStatus == AttachmentUploadStatus.success &&
              state.downloadUrl != null) {
            context
                .read<DonationCreationBloc>()
                .add(VideoAttachmentModified(state.downloadUrl!));
          }
        },
        builder: (context, state) {
          return CreationFormField(
            label: 'Add Video Attachment',
            child: Visibility(
              visible: widget.controller.text.isNotEmpty,
              child: TextField(
                controller: widget.controller,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AttachmentUploadStatusWidget(
                      uploadStatus: state.uploadStatus,
                      uploadProgress: state.uploadProgress,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      context
                          .read<AttachmentUploadBloc>()
                          .add(AttachmentUploadCancelled());
                      context
                          .read<DonationCreationBloc>()
                          .add(VideoAttachmentModified(null));

                      setState(() {
                        widget.controller.text = '';
                      });
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ),
              replacement: OutlinedButton(
                onPressed: () async {
                  final file = await ImagePicker().pickVideo(
                      source: ImageSource.gallery,
                      maxDuration: Duration(minutes: 1));

                  if (file != null) {
                    context.read<AttachmentUploadBloc>().add(
                        UploadAttachmentRequested(
                            file: File(file.path),
                            attachmentType: AttachmentType.video));

                    widget.controller.text = file.name;
                  }
                },
                child: Text('ADD'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddDocumentInput extends StatefulWidget {
  final TextEditingController controller;

  const _AddDocumentInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<_AddDocumentInput> createState() => _AddDocumentInputState();
}

class _AddDocumentInputState extends State<_AddDocumentInput> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AttachmentUploadBloc>(),
      child: BlocConsumer<AttachmentUploadBloc, AttachmentUploadState>(
        listener: (context, state) {
          if (state.uploadStatus == AttachmentUploadStatus.error &&
              state.error != null) {
            final snackBar = SnackBar(
              content: Text(state.error!),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.uploadStatus == AttachmentUploadStatus.success &&
              state.downloadUrl != null) {
            context
                .read<DonationCreationBloc>()
                .add(DocumentAttachmentModified(state.downloadUrl!));
          }
        },
        builder: (context, state) {
          return CreationFormField(
            label: 'Add Document',
            child: Visibility(
              visible: widget.controller.text.isNotEmpty,
              child: TextField(
                controller: widget.controller,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AttachmentUploadStatusWidget(
                      uploadStatus: state.uploadStatus,
                      uploadProgress: state.uploadProgress,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      context
                          .read<AttachmentUploadBloc>()
                          .add(AttachmentUploadCancelled());
                      context
                          .read<DonationCreationBloc>()
                          .add(DocumentAttachmentModified(null));
                      setState(() {
                        widget.controller.text = '';
                      });
                    },
                    icon: Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ),
              replacement: OutlinedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: [
                      'jpg',
                      'pdf',
                    ],
                  );
                  if (result != null) {
                    final file = File(result.files.first.path!);
                    context.read<AttachmentUploadBloc>().add(
                          UploadAttachmentRequested(
                              file: file,
                              attachmentType: AttachmentType.document),
                        );
                    widget.controller.text = result.files.first.name;
                  }
                },
                child: Text('ADD'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CoverPhotoInput extends StatelessWidget {
  final String? initialCoverPhoto;
  const _CoverPhotoInput({Key? key, this.initialCoverPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreationFormField(
      label: 'Cover Photo',
      child: BlocBuilder<DonationCreationBloc, DonationCreationState>(
        builder: (context, state) {
          return ImageUploader(
            onUploadSuccess: (img) {
              context.read<DonationCreationBloc>().add(CoverPhotoModified(img));
            },
            onImageRemove: (_) {
              context
                  .read<DonationCreationBloc>()
                  .add(CoverPhotoModified(null));
            },
            maxImages: 1,
            initialImages:
                initialCoverPhoto != null ? [initialCoverPhoto!] : [],
          );
        },
      ),
    );
  }
}

class _SubmitFormButton extends StatelessWidget {
  final String label;
  const _SubmitFormButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCreationBloc, DonationCreationState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () {
                  context
                      .read<DonationCreationBloc>()
                      .add(DonationCreationFormSubmitted());
                }
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.status.isSubmissionInProgress)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              Text(label),
            ],
          ),
        );
      },
    );
  }
}

class AttachmentUploadStatusWidget extends StatelessWidget {
  final AttachmentUploadStatus uploadStatus;
  final double uploadProgress;
  const AttachmentUploadStatusWidget(
      {Key? key, required this.uploadStatus, this.uploadProgress = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (uploadStatus == AttachmentUploadStatus.running) {
      return SizedBox(
        width: 8,
        height: 8,
        child: CircularProgressIndicator(
          value: uploadProgress / 100,
        ),
      );
    } else if (uploadStatus == AttachmentUploadStatus.success) {
      return Icon(Icons.check_circle);
    } else if (uploadStatus == AttachmentUploadStatus.error) {
      return Icon(
        Icons.error,
        color: Colors.red,
      );
    }
    return SizedBox.shrink();
  }
}
