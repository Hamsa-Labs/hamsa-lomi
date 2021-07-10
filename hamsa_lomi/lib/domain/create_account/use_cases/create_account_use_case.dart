import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entities/user.dart';
import '../repositories/create_account_repository.dart';

@lazySingleton
class CreateAccountUseCase {
  final CreateAccountRepository _repository;

  CreateAccountUseCase(this._repository);

  Future<Either<Failure, User>> createAccount(User user) async {
    return await _repository.createAccount(user);
  }
}
