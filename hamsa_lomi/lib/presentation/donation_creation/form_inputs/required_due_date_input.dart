// Package imports:
import 'package:formz/formz.dart';

enum RequiredDueDateInputError { empty, lessThanMinimum }

class RequiredDueDateInput
    extends FormzInput<DateTime?, RequiredDueDateInputError> {
  RequiredDueDateInput.dirty(DateTime value) : super.dirty(value);

  const RequiredDueDateInput.pure() : super.pure(null);

  @override
  RequiredDueDateInputError? validator(DateTime? value) {
    if (value == null) {
      return RequiredDueDateInputError.empty;
    }

    final lessThanToday = value.compareTo(DateTime.now()) < 0;
    return lessThanToday ? RequiredDueDateInputError.lessThanMinimum : null;
  }
}
