import 'package:formz/formz.dart';

enum PhoneNumberInputError { empty, invalid }

class PhoneNumberInput extends FormzInput<String, PhoneNumberInputError> {
  const PhoneNumberInput.pure() : super.pure('');

  PhoneNumberInput.dirty(String value) : super.dirty(value);

  @override
  PhoneNumberInputError? validator(String value) {
    if (value.isEmpty) {
      return PhoneNumberInputError.empty;
    }

    final pattern = r'^(?:[+0][1-9])?[0-9]{11,12}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(value) ? null : PhoneNumberInputError.invalid;
  }
}
