import 'package:equatable/equatable.dart';

/// A model used for signing in a user with email and password.
class SignInCredential extends Equatable {
  /// Unique email address for a user.
  final String email;

  /// A password that will be used if you're trying to sign up with email.
  final String password;

  SignInCredential(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
