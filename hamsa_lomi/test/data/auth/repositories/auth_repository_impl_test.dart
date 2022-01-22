// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/data/auth/data_sources/auth_data_source.dart';
import 'package:hamsa_lomi/data/auth/models/create_user_model.dart';
import 'package:hamsa_lomi/data/auth/repositories/auth_repository_impl.dart';
import 'package:hamsa_lomi/data/core/exceptions/server_exception.dart';
import 'package:hamsa_lomi/domain/auth/entities/sign_in_credential.dart';
import 'package:hamsa_lomi/domain/core/failure.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthDataSource])
void main() {
  late AuthRepositoryImpl signInRepositoryImpl;
  late MockAuthDataSource mockSignInDataSource;

  setUp(() {
    mockSignInDataSource = MockAuthDataSource();
    signInRepositoryImpl = AuthRepositoryImpl(mockSignInDataSource);
  });

  group('signInWithEmail', () {
    final tCredential = SignInCredential('test@domain.com', 'pass@123');

    test('should call data source to sign in a user with email and password',
        () async {
      when(
        mockSignInDataSource.signInWithEmail(
            tCredential.email, tCredential.password),
      ).thenAnswer((_) async => null);

      final result = await signInRepositoryImpl.signInWithEmail(tCredential);

      verify(mockSignInDataSource.signInWithEmail(
          tCredential.email, tCredential.password));

      expect(result, right(unit));
    });

    test('should return left side of either when an exception is thrown',
        () async {
      when(mockSignInDataSource.signInWithEmail(
              tCredential.email, tCredential.password))
          .thenThrow(ServerException());

      final result = await signInRepositoryImpl.signInWithEmail(tCredential);

      expect(result, left(Failure()));
    });
  });

  group('createAccount', () {
    final tUserModel = CreateUserModel(
        username: 'testusername',
        email: 'test@domain.com',
        password: 'pass@1234');

    test('should call data source method', () async {
      when(mockSignInDataSource.createAccount(tUserModel))
          .thenAnswer((_) async => tUserModel);

      final result = await signInRepositoryImpl.createAccount(tUserModel);

      verify(mockSignInDataSource.createAccount(tUserModel));
      expect(result, right(tUserModel));
    });

    test('should return a failure when something goes wrong', () async {
      when(mockSignInDataSource.createAccount(tUserModel))
          .thenThrow(ServerException());

      final result = await signInRepositoryImpl.createAccount(tUserModel);

      expect(result, left(Failure()));
    });
  });
}
