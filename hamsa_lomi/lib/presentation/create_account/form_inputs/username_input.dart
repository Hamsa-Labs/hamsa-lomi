import 'package:formz/formz.dart';

enum UsernameInputError { empty }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');
  UsernameInput.dirty(String value) : super.dirty(value);

  @override
  UsernameInputError? validator(String value) {
    return value.isEmpty ? UsernameInputError.empty : null;
  }
}
