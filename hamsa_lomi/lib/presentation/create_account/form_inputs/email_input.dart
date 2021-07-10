// Package imports:
import 'package:formz/formz.dart';

enum EmailInputError { empty }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  EmailInput.dirty(String value) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    // TODO: Add more email validations
    return value.isEmpty ? EmailInputError.empty : null;
  }
}
