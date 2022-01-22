// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/auth/entities/create_user.dart';
import '../../../domain/auth/entities/sign_in_credential.dart';
import '../../../domain/auth/entities/verify_phone_number_param.dart';
import '../../../domain/auth/entities/verify_sms_code_param.dart';
import '../../../domain/auth/repositories/auth_repository.dart';
import '../../../domain/core/failure.dart';
import '../../core/exceptions/server_exception.dart';
import '../data_sources/auth_data_source.dart';
import '../models/create_user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, CreateUser>> createAccount(CreateUser user) async {
    try {
      final result = await _dataSource.createAccount(CreateUserModel(
          username: user.username, password: user.password, email: user.email));
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmail(
      SignInCredential credential) async {
    try {
      await _dataSource.signInWithEmail(credential.email, credential.password);

      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithPhone(
      VerifyPhoneNumberParam param) async {
    await _dataSource.signInWithPhone(param);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> verifySmsCode(VerifySmsCodeParam param) async {
    try {
      await _dataSource.verifySmsCode(param);

      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Stream<User?> get userChanges => _dataSource.userChanges;
}
