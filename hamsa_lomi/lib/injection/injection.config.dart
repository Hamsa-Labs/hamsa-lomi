// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// Project imports:
import '../data/auth/data_sources/auth_data_source.dart' as _i4;
import '../data/auth/repositories/auth_repository_impl.dart' as _i6;
import '../domain/auth/repositories/auth_repository.dart' as _i5;
import '../domain/auth/use_cases/create_account_use_case.dart' as _i7;
import '../domain/auth/use_cases/sign_in_use_case.dart' as _i8;
import '../domain/auth/use_cases/verify_phone_number_use_case.dart' as _i10;
import '../domain/auth/use_cases/verify_sms_code_use_case.dart' as _i11;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i12;

import '../presentation/sign_in/blocs/sign_in_with_email/sign_in_email_bloc.dart'
    as _i9;
import '../presentation/sign_in/blocs/sign_in_with_phone/sign_in_with_phone_bloc.dart'
    as _i13;
import 'modules.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.FirebaseAuth>(() => registerModule.auth);
  gh.lazySingleton<_i4.AuthDataSource>(
      () => _i4.AuthDataSourceImpl(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i5.AuthRepository>(
      () => _i6.AuthRepositoryImpl(get<_i4.AuthDataSource>()));
  gh.lazySingleton<_i7.CreateAccountUseCase>(
      () => _i7.CreateAccountUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i8.SignInUseCase>(
      () => _i8.SignInUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i9.SignInWithEmailBloc>(
      () => _i9.SignInWithEmailBloc(get<_i8.SignInUseCase>()));
  gh.factory<_i10.VerifyPhoneNumberUseCase>(
      () => _i10.VerifyPhoneNumberUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i11.VerifySmsCodeUseCase>(
      () => _i11.VerifySmsCodeUseCase(get<_i5.AuthRepository>()));
  gh.factory<_i12.CreateAccountBloc>(
      () => _i12.CreateAccountBloc(get<_i7.CreateAccountUseCase>()));
  gh.factory<_i13.SignInWithPhoneBloc>(() => _i13.SignInWithPhoneBloc(
      get<_i10.VerifyPhoneNumberUseCase>(), get<_i11.VerifySmsCodeUseCase>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
