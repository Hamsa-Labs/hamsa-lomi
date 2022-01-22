// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../core/failure.dart';
import '../entities/create_user.dart';
import '../entities/sign_in_credential.dart';
import '../entities/verify_phone_number_param.dart';
import '../entities/verify_sms_code_param.dart';

abstract class AuthRepository {
  Future<Either<Failure, CreateUser>> createAccount(CreateUser user);

  Future<Either<Failure, Unit>> signInWithEmail(SignInCredential credential);

  Future<Either<Failure, Unit>> signInWithPhone(VerifyPhoneNumberParam param);

  Future<Either<Failure, Unit>> verifySmsCode(VerifySmsCodeParam param);

  Stream<User?> get userChanges;
}
