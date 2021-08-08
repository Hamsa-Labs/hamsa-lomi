// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/core/failure.dart';
import '../../../domain/sign_in/entities/sign_in_credential.dart';
import '../../../domain/sign_in/repositories/sign_in_repository.dart';
import '../../core/exceptions/server_exception.dart';
import '../data_sources/sign_in_data_source.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource _dataSource;

  SignInRepositoryImpl(this._dataSource);

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
}
