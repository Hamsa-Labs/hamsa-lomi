// Package imports:
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Password extends Equatable {
  final String password;
  final String confirmPassword;

  const Password({this.password = '', this.confirmPassword = ''});

  @override
  List<Object> get props => [password, confirmPassword];
}

enum PasswordInputError { empty, doesNotMatch }

class PasswordInput extends FormzInput<Password, PasswordInputError> {
  const PasswordInput.pure()
      : super.pure(const Password(password: '', confirmPassword: ''));
  PasswordInput.dirty(Password value) : super.dirty(value);

  @override
  PasswordInputError? validator(Password value) {
    if (value.password != value.confirmPassword) {
      return PasswordInputError.doesNotMatch;
    }

    return value.password.isEmpty || value.confirmPassword.isEmpty
        ? PasswordInputError.empty
        : null;
  }
}
