// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/create_account/entities/user.dart';
import '../exceptions/create_account_exception.dart';
import '../models/user_model.dart';

abstract class CreateAccountDataSource {
  Future<User> createAccount(UserModel userModel);
}

@LazySingleton(as: CreateAccountDataSource)
class CreateAccountDataSourceImpl implements CreateAccountDataSource {
  final fire_auth.FirebaseAuth _auth;

  CreateAccountDataSourceImpl(this._auth);

  @override
  Future<User> createAccount(UserModel userModel) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      await credentials.user?.updateDisplayName(userModel.username);

      // TODO: Think about what should be returned from this method.
      return userModel;
    } on fire_auth.FirebaseAuthException catch (e) {
      var message = 'something went wrong';
      if (e.code == 'email-already-in-use') {
        message = 'email address already in use';
      } else if (e.code == 'invalid-email') {
        message = 'invalid email address';
      } else if (e.code == 'weak-password') {
        message = 'password is weak';
      }

      throw CreateAccountException(message);
    }
  }
}
