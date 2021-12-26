// Package imports:
import 'package:formz/formz.dart';

enum RequiredInputError { empty }

class RequiredTextInput extends FormzInput<String, RequiredInputError> {
  const RequiredTextInput.pure() : super.pure('');
  RequiredTextInput.dirty(String value) : super.dirty(value);

  @override
  RequiredInputError? validator(String value) {
    return value.isEmpty ? RequiredInputError.empty : null;
  }
}
