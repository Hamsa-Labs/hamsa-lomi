// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../repositories/auth_repository.dart';

@lazySingleton
class GetUserChangesStreamUseCase {
  final AuthRepository _repository;

  GetUserChangesStreamUseCase(this._repository);

  Stream<User?> call() {
    return _repository.userChanges;
  }
}
