// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:hamsa_lomi/data/create_account/exceptions/create_account_exception.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/data/create_account/data_sources/create_account_data_source.dart';
import 'package:hamsa_lomi/data/create_account/models/user_model.dart';
import 'create_account_data_source_test.mocks.dart';

@GenerateMocks(
    [fire_auth.FirebaseAuth, fire_auth.UserCredential, fire_auth.User])
void main() {
  late CreateAccountDataSourceImpl dataSource;
  late MockFirebaseAuth mock;
  late MockUserCredential mockUserCredential;
  late MockUser mockFirebaseUser;

  setUp(() {
    mock = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockFirebaseUser = MockUser();
    dataSource = CreateAccountDataSourceImpl(mock);
  });

  final tUserModel = UserModel(
      username: 'testuser', email: 'test@domain.com', password: 'pass@1234');

  test('should call firebase auth for creating account', () async {
    when(mock.createUserWithEmailAndPassword(
            email: tUserModel.email, password: tUserModel.password))
        .thenAnswer((_) async => await mockUserCredential);
    when(mockUserCredential.user).thenReturn(mockFirebaseUser);
    when(mockFirebaseUser.updateDisplayName(tUserModel.username))
        .thenAnswer((_) async => await Future.value());

    await dataSource.createAccount(tUserModel);
    verify(mock.createUserWithEmailAndPassword(
        email: tUserModel.email, password: tUserModel.password));
  });

  test('should catch FirebaseAuthException', () async {
    when(mock.createUserWithEmailAndPassword(
            email: tUserModel.email, password: tUserModel.password))
        .thenThrow(
            fire_auth.FirebaseAuthException(code: 'email-already-in-use'));
    expect(() async => await dataSource.createAccount(tUserModel),
        throwsA(isA<CreateAccountException>()));
  });
}
