// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// Project imports:
import '../data/sign_in/data_sources/sign_in_data_source.dart' as _i4;
import '../data/sign_in/repositories/sign_in_repository_impl.dart' as _i6;
import '../domain/sign_in/repositories/sign_in_repository.dart' as _i5;
import '../domain/sign_in/use_cases/sign_in_use_case.dart' as _i7;
import '../domain/sign_in/use_cases/verify_phone_number_use_case.dart' as _i9;
import '../domain/sign_in/use_cases/verify_sms_code_use_case.dart' as _i10;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i16;

import '../data/create_account/data_sources/create_account_data_source.dart'
    as _i11;
import '../data/create_account/repositories/create_account_repository_impl.dart'
    as _i13;
import '../domain/create_account/repositories/create_account_repository.dart'
    as _i12;
import '../domain/create_account/use_cases/create_account_use_case.dart'
    as _i14;
import '../presentation/sign_in/blocs/sign_in_with_email/sign_in_email_bloc.dart'
    as _i8;
import '../presentation/sign_in/blocs/sign_in_with_phone/sign_in_with_phone_bloc.dart'
    as _i15;
import 'modules.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.FirebaseAuth>(() => registerModule.auth);
  gh.lazySingleton<_i4.SignInDataSource>(
      () => _i4.SignInDataSourceImpl(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i5.SignInRepository>(
      () => _i6.SignInRepositoryImpl(get<_i4.SignInDataSource>()));
  gh.factory<_i7.SignInUseCase>(
      () => _i7.SignInUseCase(get<_i5.SignInRepository>()));
  gh.factory<_i8.SignInWithEmailBloc>(
      () => _i8.SignInWithEmailBloc(get<_i7.SignInUseCase>()));
  gh.factory<_i9.VerifyPhoneNumberUseCase>(
      () => _i9.VerifyPhoneNumberUseCase(get<_i5.SignInRepository>()));
  gh.factory<_i10.VerifySmsCodeUseCase>(
      () => _i10.VerifySmsCodeUseCase(get<_i5.SignInRepository>()));
  gh.lazySingleton<_i11.CreateAccountDataSource>(
      () => _i11.CreateAccountDataSourceImpl(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i12.CreateAccountRepository>(() =>
      _i13.CreateAccountRepositoryImpl(get<_i11.CreateAccountDataSource>()));
  gh.lazySingleton<_i14.CreateAccountUseCase>(
      () => _i14.CreateAccountUseCase(get<_i12.CreateAccountRepository>()));
  gh.factory<_i15.SignInWithPhoneBloc>(() => _i15.SignInWithPhoneBloc(
      get<_i9.VerifyPhoneNumberUseCase>(), get<_i10.VerifySmsCodeUseCase>()));
  gh.factory<_i16.CreateAccountBloc>(
      () => _i16.CreateAccountBloc(get<_i14.CreateAccountUseCase>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
