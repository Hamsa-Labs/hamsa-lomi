// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../constants/app_assets_constant.dart';
import 'creation_form_field.dart';

class DonationCreationForm extends StatelessWidget {
  const DonationCreationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          ],
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  const _TitleInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreationFormField(
      label: 'Title',
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

class _CategoryInput extends StatelessWidget {
  final List<String> _categories = const [
    'Health',
    'Education',
    'Personal',
    'Charity',
    'Medical'
  ];

  const _CategoryInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreationFormField(
        label: 'Category',
        child: DropdownButtonFormField(
          items: _categories.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          onChanged: (newValue) {},
        ));
  }
}

class _GoalInput extends StatelessWidget {
  const _GoalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  const _DescriptionInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}

class _DueDateInput extends StatelessWidget {
  const _DueDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
