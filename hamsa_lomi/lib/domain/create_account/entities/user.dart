// Package imports:
import 'package:equatable/equatable.dart';

/// A model for creating a user account.
class User extends Equatable {
  /// Unique handle for a particular user.
  final String username;

  /// Unique email address for a user.
  final String email;

  /// A password that will be used if you're trying to sign up with email.
  final String password;

  User({required this.username, required this.email, required this.password});

  @override
  List<Object> get props => [
        username,
        email,
        password,
      ];
}
