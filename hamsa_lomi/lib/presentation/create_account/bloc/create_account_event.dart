part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends CreateAccountEvent {
  final String username;

  UsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class EmailChanged extends CreateAccountEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends CreateAccountEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends CreateAccountEvent {
  final String confirmPassword;

  ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class CreateAccountSubmitted extends CreateAccountEvent {}
