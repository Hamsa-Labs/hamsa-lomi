import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:injectable/injectable.dart';

import '../../../domain/create_account/entities/user.dart';
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
    // TODO: Catch FirebaseAuthException:
    // https://blog.logrocket.com/implementing-firebase-authentication-in-a-flutter-app/
    final credentials = await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    await credentials.user?.updateDisplayName(userModel.username);
    return userModel;
  }
}
