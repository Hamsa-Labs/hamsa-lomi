part of 'sign_in_email_bloc.dart';

class SignInWithEmailState extends Equatable {
  final EmailInput email;

  final PasswordInput password;

  final FormzStatus status;

  final String? error;

  const SignInWithEmailState(
      {this.error,
      this.email = const EmailInput.pure(),
      this.password = const PasswordInput.pure(),
      this.status = FormzStatus.pure});

  @override
  List<Object?> get props => [email, password, status, error];

  SignInWithEmailState copyWith(
      {EmailInput? email,
      PasswordInput? password,
      FormzStatus? status,
      String? error}) {
    return SignInWithEmailState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
