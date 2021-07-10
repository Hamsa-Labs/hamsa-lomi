import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/create_account/entities/user.dart';
import '../../../domain/create_account/repositories/create_account_repository.dart';
import '../data_sources/create_account_data_source.dart';
import '../models/user_model.dart';

@LazySingleton(as: CreateAccountRepository)
class CreateAccountRepositoryImpl extends CreateAccountRepository {
  final CreateAccountDataSource _dataSource;

  CreateAccountRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, User>> createAccount(User user) async {
    // TODO: Handle Exceptions and also write tests for the exceptions.
    final result = await _dataSource.createAccount(UserModel(
        username: user.username, password: user.password, email: user.email));
    return right(result);
  }
}
