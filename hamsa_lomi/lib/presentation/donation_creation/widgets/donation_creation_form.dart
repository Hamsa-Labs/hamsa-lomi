// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../../domain/core/core.dart';
import '../../../injection/injection.dart';
import '../../constants/app_assets_constant.dart';
import '../bloc/donation_creation/donation_creation_bloc.dart';
import 'creation_form_field.dart';
import 'image_uploader.dart';

class DonationCreationForm extends StatelessWidget {
  const DonationCreationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => getIt<DonationCreationBloc>(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter The Following Details',
                style: Theme.of(context).textTheme.headline5,
              ),
              _TitleInput(),
              _CategoryInput(),
              _GoalInput(),
              _DescriptionInput(),
              _DueDateInput(),
              _GalleryInput(),
              _AddVideoInput(),
              Center(child: _SubmitFormButton()),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  const _TitleInput({Key? key}) : super(key: key);

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
  final List<Map<String, dynamic>> _categories = const [
    {'value': DonationCategory.health, 'display': 'Health'},
    {'value': DonationCategory.education, 'display': 'Education'},
    {'value': DonationCategory.personal, 'display': 'Personal'},
    {'value': DonationCategory.charity, 'display': 'Charity'},
    {'value': DonationCategory.medical, 'display': 'Medical'},
  ];

  const _CategoryInput({Key? key}) : super(key: key);

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
            ));
      },
    );
  }
}

class _GoalInput extends StatelessWidget {
  const _GoalInput({Key? key}) : super(key: key);

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
  const _DescriptionInput({Key? key}) : super(key: key);

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
  const _DueDateInput({Key? key}) : super(key: key);

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
  const _GalleryInput({Key? key}) : super(key: key);

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
          ),
        );
      },
    );
  }
}

class _SubmitFormButton extends StatelessWidget {
  const _SubmitFormButton({Key? key}) : super(key: key);

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
              Text('Start'),
            ],
          ),
        );
      },
    );
  }
}

class _AddVideoInput extends StatefulWidget {
  const _AddVideoInput({Key? key}) : super(key: key);

  @override
  State<_AddVideoInput> createState() => _AddVideoInputState();
}

class _AddVideoInputState extends State<_AddVideoInput> {
  XFile? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return CreationFormField(
      label: 'Add Video Attachment',
      child: Visibility(
        visible: _pickedFile != null,
        child: TextField(
          controller: TextEditingController(text: _pickedFile?.name ?? ''),
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 8,
                height: 8,
                child: CircularProgressIndicator(),
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _pickedFile = null;
                });
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
        replacement: OutlinedButton(
          onPressed: () async {
            final file = await ImagePicker().pickVideo(
                source: ImageSource.gallery, maxDuration: Duration(minutes: 1));
            setState(() {
              _pickedFile = file;
            });
          },
          child: Text('ADD'),
        ),
      ),
    );
  }
}
