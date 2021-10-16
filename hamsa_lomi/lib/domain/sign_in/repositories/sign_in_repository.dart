// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../core/failure.dart';
import '../entities/sign_in_credential.dart';
import '../entities/verify_phone_number_param.dart';
import '../entities/verify_sms_code_param.dart';

abstract class SignInRepository {
  Future<Either<Failure, Unit>> signInWithEmail(SignInCredential credential);

  Future<Either<Failure, Unit>> signInWithPhone(VerifyPhoneNumberParam param);

  Future<Either<Failure, Unit>> verifySmsCode(VerifySmsCodeParam param);
}
