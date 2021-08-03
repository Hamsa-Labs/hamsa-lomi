import 'package:dartz/dartz.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/sign_in/entities/sign_in_credential.dart';
import '../../../domain/sign_in/repositories/sign_in_repository.dart';
import '../data_sources/sign_in_data_source.dart';
import '../exceptions/sign_in_exception.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource _dataSource;

  SignInRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, Unit>> signInWithEmail(
      SignInCredential credential) async {
    try {
      await _dataSource.signInWithEmail(credential.email, credential.password);

      return right(unit);
    } on SignInException catch (e) {
      return left(Failure(e.message));
    }
  }
}
