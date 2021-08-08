part of 'sign_in_bloc.dart';

class SignInBlocState extends Equatable {
  final EmailInput email;

  final PasswordInput password;

  final FormzStatus status;

  final String? error;

  const SignInBlocState(
      {this.error,
      this.email = const EmailInput.pure(),
      this.password = const PasswordInput.pure(),
      this.status = FormzStatus.pure});

  @override
  List<Object?> get props => [email, password, status, error];

  SignInBlocState copyWith(
      {EmailInput? email,
      PasswordInput? password,
      FormzStatus? status,
      String? error}) {
    return SignInBlocState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        error: error);
  }
}
