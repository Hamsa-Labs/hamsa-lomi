// Package imports:
import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  EmailInput.dirty(String value) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (value.isEmpty) {
      return EmailInputError.empty;
    }

    if (!RegExp(emailRegex).hasMatch(value)) {
      return EmailInputError.invalid;
    }
  }
}
