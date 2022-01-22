// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/auth/entities/create_user.dart';
import '../../../domain/auth/entities/verify_phone_number_param.dart';
import '../../../domain/auth/entities/verify_sms_code_param.dart';
import '../../core/exceptions/server_exception.dart';
import '../models/create_user_model.dart';

abstract class AuthDataSource {
  Future<CreateUser> createAccount(CreateUserModel userModel);

  Future<void> signInWithEmail(String email, String password);

  Future<void> signInWithPhone(VerifyPhoneNumberParam param);

  Future<void> verifySmsCode(VerifySmsCodeParam param);

  Stream<User?> get userChanges;
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _auth;

  AuthDataSourceImpl(this._auth);

  @override
  Future<CreateUser> createAccount(CreateUserModel userModel) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      await credentials.user?.updateDisplayName(userModel.username);

      // TODO: Think about what should be returned from this method.
      return userModel;
    } on FirebaseAuthException catch (e) {
      var message = 'something went wrong';
      if (e.code == 'email-already-in-use') {
        message = 'email address already in use';
      } else if (e.code == 'invalid-email') {
        message = 'invalid email address';
      } else if (e.code == 'weak-password') {
        message = 'password is weak';
      }

      throw ServerException(message);
    }
  }

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

  @override
  Future<void> signInWithPhone(VerifyPhoneNumberParam param) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: param.phoneNumber,
          verificationCompleted: (credential) async {
            // Sign the user in (or link) with the auto-generated credential
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            var error = 'Something went wrong.';
            if (e.code == 'invalid-phone-number') {
              error = 'Invalid phone number.';
            } else if (e.code == 'captcha-check-failed') {
              error = 'Captcha check failed.';
            } else if (e.code == 'missing-phone-number') {
              error = 'Missing phone number';
            } else if (e.code == 'quota-exceeded') {
              error = 'Quota exceeded. Try again later.';
            } else if (e.code == 'user-disabled') {
              error = 'User disabled';
            }
            param.verificationFailed(error);
          },
          codeSent: (verificationId, refreshToken) {
            param.codeSent(verificationId, refreshToken);
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on Exception catch (_) {
      param.verificationFailed('Something went wrong!');
    }
  }

  @override
  Future<void> verifySmsCode(VerifySmsCodeParam param) async {
    // Create a PhoneAuthCredential with the code
    final credential = PhoneAuthProvider.credential(
        verificationId: param.verificationId, smsCode: param.smsCode);

    try {
      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      var message = 'Something went wrong';
      if (e.code == 'invalid-credential') {
        message = 'Credential has expired.';
      } else if (e.code == 'user-disabled') {
        message = 'User is disabled.';
      } else if (e.code == 'invalid-verification-code') {
        message = 'Invalid verification code.';
      } else if (e.code == 'invalid-verification-id') {
        message = 'Invalid verification ID.';
      }

      throw ServerException(message);
    }
  }

  @override
  Stream<User?> get userChanges => _auth.userChanges();
}
