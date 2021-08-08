part of 'sign_in_bloc.dart';

abstract class SignInBlocEvent extends Equatable {}

class EmailChanged extends SignInBlocEvent {
  final String email;

  EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInBlocEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignInSubmitted extends SignInBlocEvent {
  @override
  List<Object> get props => [];
}
