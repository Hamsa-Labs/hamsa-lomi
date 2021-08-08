// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/exceptions/server_exception.dart';

abstract class SignInDataSource {
  Future<void> signInWithEmail(String email, String password);
}

@LazySingleton(as: SignInDataSource)
class SignInDataSourceImpl implements SignInDataSource {
  final FirebaseAuth _auth;

  SignInDataSourceImpl(this._auth);

  @override
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      var message = 'Something went wrong';
      if (e.code == 'invalid-email') {
        message = 'Invalid email address';
      } else if (e.code == 'user-disabled') {
        message = 'Account disabled';
      } else if (e.code == 'user-not-found') {
        message = 'User not found';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password';
      }

      throw ServerException(message);
    }
  }
}
