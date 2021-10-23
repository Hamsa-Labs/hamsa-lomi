part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class Authenticated extends AuthEvent {
  final User user;

  Authenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthEvent {
  @override
  List<Object?> get props => [];
}
