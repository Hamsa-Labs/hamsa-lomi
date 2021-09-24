// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../core/failure.dart';
import '../entities/sign_in_credential.dart';

abstract class SignInRepository {
  Future<Either<Failure, Unit>> signInWithEmail(SignInCredential credential);
}
