// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/data/auth/data_sources/auth_data_source.dart';
import 'package:hamsa_lomi/data/auth/models/create_user_model.dart';
import 'package:hamsa_lomi/data/core/exceptions/server_exception.dart';
import 'auth_data_source_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential, User])
void main() {
  late AuthDataSource dataSource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockFirebaseUser;

  setUp(() {
    mockFirebaseUser = MockUser();
    mockUserCredential = MockUserCredential();
    mockFirebaseAuth = MockFirebaseAuth();
    dataSource = AuthDataSourceImpl(mockFirebaseAuth);
  });

  final tEmail = 'test@domain.com';
  final tPassword = 'pass@123';

  group('signInWithEmail', () {
    test('should call firebase auth sign', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: tEmail, password: tPassword))
          .thenAnswer((_) async => mockUserCredential);
      await dataSource.signInWithEmail(tEmail, tPassword);

      verify(mockFirebaseAuth.signInWithEmailAndPassword(
          email: tEmail, password: tPassword));
    });

    test('should handle exception properly', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: tEmail, password: tPassword))
          .thenThrow(FirebaseAuthException(code: 'invalid-email'));

      expect(() async => await dataSource.signInWithEmail(tEmail, tPassword),
          throwsA(isA<ServerException>()));
    });
  });

  group('createAccount', () {
    final tUserModel = CreateUserModel(
        username: 'testuser', email: 'test@domain.com', password: 'pass@1234');

    test('should call firebase auth for creating account', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: tUserModel.email, password: tUserModel.password))
          .thenAnswer((_) async => await mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockFirebaseUser);
      when(mockFirebaseUser.updateDisplayName(tUserModel.username))
          .thenAnswer((_) async => await Future.value());

      await dataSource.createAccount(tUserModel);
      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tUserModel.email, password: tUserModel.password));
    });

    test('should catch FirebaseAuthException', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: tUserModel.email, password: tUserModel.password))
          .thenThrow(FirebaseAuthException(code: 'email-already-in-use'));
      expect(() async => await dataSource.createAccount(tUserModel),
          throwsA(isA<ServerException>()));
    });
  });
}
