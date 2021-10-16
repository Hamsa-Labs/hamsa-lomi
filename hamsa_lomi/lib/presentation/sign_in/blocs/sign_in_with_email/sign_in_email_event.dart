part of 'sign_in_email_bloc.dart';

abstract class SignInWithEmailEvent extends Equatable {}

class EmailChanged extends SignInWithEmailEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInWithEmailEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignInSubmitted extends SignInWithEmailEvent {
  @override
  List<Object> get props => [];
}
