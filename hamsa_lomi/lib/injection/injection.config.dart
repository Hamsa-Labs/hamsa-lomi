// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/auth/data_sources/auth_data_source.dart' as _i18;
import '../data/auth/repositories/auth_repository_impl.dart' as _i20;
import '../data/donation_creation/data_sources/donation_creation_data_source.dart'
    as _i7;
import '../data/donation_creation/donation_creation.dart' as _i9;
import '../data/donation_creation/repositories/donation_creation_repository_impl.dart'
    as _i8;
import '../data/get_donation_campaigns/data_sources/get_donation_campaign_data_source.dart'
    as _i11;
import '../data/get_donation_campaigns/repositories/get_donation_campaign_repository_impl.dart'
    as _i13;
import '../domain/auth/repositories/auth_repository.dart' as _i19;
import '../domain/auth/use_cases/create_account_use_case.dart' as _i21;
import '../domain/auth/use_cases/get_user_changes_stream_use_case.dart' as _i22;
import '../domain/auth/use_cases/sign_in_use_case.dart' as _i23;
import '../domain/auth/use_cases/verify_phone_number_use_case.dart' as _i25;
import '../domain/auth/use_cases/verify_sms_code_use_case.dart' as _i26;
import '../domain/donation_creation/donation_creation.dart' as _i6;
import '../domain/donation_creation/repositories/repositories.dart' as _i4;
import '../domain/donation_creation/use_cases/create_hamsa_campain_use_case.dart'
    as _i3;
import '../domain/donation_creation/use_cases/upload_attachment_use_case.dart'
    as _i16;
import '../domain/get_donation_campaigns/repositories/get_donation_campaign_repository.dart'
    as _i12;
import '../domain/get_donation_campaigns/use_cases/get_donation_campaign_use_case.dart'
    as _i14;
import '../presentation/auth/bloc/auth_bloc.dart' as _i27;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i28;
import '../presentation/donation_creation/bloc/donation_creation/donation_creation_bloc.dart'
    as _i5;
import '../presentation/donation_creation/bloc/image_upload/attachment_upload_bloc.dart'
    as _i17;
import '../presentation/home/bloc/get_donation_campaigns_bloc.dart' as _i15;
import '../presentation/sign_in/blocs/sign_in_with_email/sign_in_email_bloc.dart'
    as _i24;
import '../presentation/sign_in/blocs/sign_in_with_phone/sign_in_with_phone_bloc.dart'
    as _i29;
import 'modules.dart' as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.CreateHamsaCampaignUseCase>(() =>
      _i3.CreateHamsaCampaignUseCase(get<_i4.DonationCreationRepository>()));
  gh.factory<_i5.DonationCreationBloc>(
      () => _i5.DonationCreationBloc(get<_i6.CreateHamsaCampaignUseCase>()));
  gh.lazySingleton<_i7.DonationCreationDataSource>(
      () => _i7.DonationCreationDataSourceImpl());
  gh.lazySingleton<_i6.DonationCreationRepository>(() =>
      _i8.DonationCreationRepositoryImpl(
          get<_i9.DonationCreationDataSource>()));
  gh.factory<_i10.FirebaseAuth>(() => registerModule.auth);
  gh.lazySingleton<_i11.GetDonationCampaignDataSource>(
      () => _i11.GetDonationCampaignDataSourceImpl());
  gh.lazySingleton<_i12.GetDonationCampaignRepository>(() =>
      _i13.GetDonationCampaignRepositoryImpl(
          get<_i11.GetDonationCampaignDataSource>()));
  gh.lazySingleton<_i14.GetDonationCampaignUseCase>(() =>
      _i14.GetDonationCampaignUseCase(
          get<_i12.GetDonationCampaignRepository>()));
  gh.factory<_i15.GetDonationCampaignsBloc>(() =>
      _i15.GetDonationCampaignsBloc(get<_i14.GetDonationCampaignUseCase>()));
  gh.factory<_i16.UploadAttachmentUseCase>(() =>
      _i16.UploadAttachmentUseCase(get<_i4.DonationCreationRepository>()));
  gh.factory<_i17.AttachmentUploadBloc>(
      () => _i17.AttachmentUploadBloc(get<_i16.UploadAttachmentUseCase>()));
  gh.lazySingleton<_i18.AuthDataSource>(
      () => _i18.AuthDataSourceImpl(get<_i10.FirebaseAuth>()));
  gh.lazySingleton<_i19.AuthRepository>(
      () => _i20.AuthRepositoryImpl(get<_i18.AuthDataSource>()));
  gh.lazySingleton<_i21.CreateAccountUseCase>(
      () => _i21.CreateAccountUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i22.GetUserChangesStreamUseCase>(
      () => _i22.GetUserChangesStreamUseCase(get<_i19.AuthRepository>()));
  gh.factory<_i23.SignInUseCase>(
      () => _i23.SignInUseCase(get<_i19.AuthRepository>()));
  gh.factory<_i24.SignInWithEmailBloc>(
      () => _i24.SignInWithEmailBloc(get<_i23.SignInUseCase>()));
  gh.factory<_i25.VerifyPhoneNumberUseCase>(
      () => _i25.VerifyPhoneNumberUseCase(get<_i19.AuthRepository>()));
  gh.factory<_i26.VerifySmsCodeUseCase>(
      () => _i26.VerifySmsCodeUseCase(get<_i19.AuthRepository>()));
  gh.factory<_i27.AuthBloc>(
      () => _i27.AuthBloc(get<_i22.GetUserChangesStreamUseCase>()));
  gh.factory<_i28.CreateAccountBloc>(
      () => _i28.CreateAccountBloc(get<_i21.CreateAccountUseCase>()));
  gh.factory<_i29.SignInWithPhoneBloc>(() => _i29.SignInWithPhoneBloc(
      get<_i25.VerifyPhoneNumberUseCase>(), get<_i26.VerifySmsCodeUseCase>()));
  return get;
}

class _$RegisterModule extends _i30.RegisterModule {}
