// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/data/core/exceptions/server_exception.dart';
import 'package:hamsa_lomi/data/sign_in/data_sources/sign_in_data_source.dart';
import 'sign_in_data_source_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential])
void main() {
  late SignInDataSource signInDataSource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockUserCredential = MockUserCredential();
    mockFirebaseAuth = MockFirebaseAuth();
    signInDataSource = SignInDataSourceImpl(mockFirebaseAuth);
  });

  final tEmail = 'test@domain.com';
  final tPassword = 'pass@123';

  test('should call firebase auth sign', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: tEmail, password: tPassword))
        .thenAnswer((_) async => mockUserCredential);
    await signInDataSource.signInWithEmail(tEmail, tPassword);

    verify(mockFirebaseAuth.signInWithEmailAndPassword(
        email: tEmail, password: tPassword));
  });

  test('should handle exception properly', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: tEmail, password: tPassword))
        .thenThrow(FirebaseAuthException(code: 'invalid-email'));

    expect(
        () async => await signInDataSource.signInWithEmail(tEmail, tPassword),
        throwsA(isA<ServerException>()));
  });
}
