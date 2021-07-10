import 'package:dartz/dartz.dart';
import '../../core/failure.dart';

import '../entities/user.dart';

abstract class CreateAccountRepository {
  Future<Either<Failure, User>> createAccount(User user);
}
