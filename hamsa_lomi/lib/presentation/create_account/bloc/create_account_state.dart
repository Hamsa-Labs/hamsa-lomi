part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;
  final FormzStatus status;
  final String? error;

  const CreateAccountState(
      {this.username = const UsernameInput.pure(),
      this.email = const EmailInput.pure(),
      this.password = const PasswordInput.pure(),
      this.status = FormzStatus.pure,
      this.error});

  @override
  List<Object?> get props => [username, email, password, status, error];

  CreateAccountState copyWith(
      {UsernameInput? username,
      EmailInput? email,
      PasswordInput? password,
      FormzStatus? status,
      String? error}) {
    return CreateAccountState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
