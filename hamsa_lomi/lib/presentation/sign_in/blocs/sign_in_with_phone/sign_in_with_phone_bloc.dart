// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../domain/params/use_case_param.dart';
import '../../../../domain/sign_in/entities/verify_phone_number_param.dart';
import '../../../../domain/sign_in/entities/verify_sms_code_param.dart';
import '../../../../domain/sign_in/use_cases/verify_phone_number_use_case.dart';
import '../../../../domain/sign_in/use_cases/verify_sms_code_use_case.dart';
import '../../../core/form_inputs/phone_number_input.dart';

part 'sign_in_with_phone_event.dart';
part 'sign_in_with_phone_state.dart';

@injectable
class SignInWithPhoneBloc
    extends Bloc<SignInWithPhoneEvent, SignInWithPhoneState> {
  final VerifyPhoneNumberUseCase _verifyPhoneNumber;
  final VerifySmsCodeUseCase _verifySmsCodeUseCaseCode;

  SignInWithPhoneBloc(this._verifyPhoneNumber, this._verifySmsCodeUseCaseCode)
      : super(SignInWithPhoneState());

  @override
  Stream<SignInWithPhoneState> mapEventToState(
    SignInWithPhoneEvent event,
  ) async* {
    if (event is PhoneNumberChanged) {
      yield _mapPhoneNumberChangedToState(state, event.phoneNumber);
    } else if (event is PhoneVerificationRequested) {
      yield* _mapPhoneVerificationRequestedToState(state);
    } else if (event is CodeSent) {
      yield state.copyWith(
          status: PhoneVerificationStatus.codeSent,
          verificationId: event.verificationId);
    } else if (event is PhoneVerificationFailed) {
      yield state.copyWith(
          status: PhoneVerificationStatus.failed, error: event.errorMessage);
    } else if (event is VerifySmsCodeRequested) {
      yield* _mapVerifySmsCodeRequested(event.verificationId, event.code);
    }
  }

  SignInWithPhoneState _mapPhoneNumberChangedToState(
      SignInWithPhoneState state, String phoneNumber) {
    return state.copyWith(
      phoneNumber: PhoneNumberInput.dirty(phoneNumber),
    );
  }

  Stream<SignInWithPhoneState> _mapPhoneVerificationRequestedToState(
      SignInWithPhoneState state) async* {
    if (state.phoneNumber.valid) {
      yield state.copyWith(status: PhoneVerificationStatus.inProgress);

      await _verifyPhoneNumber(
        UseCaseParam<VerifyPhoneNumberParam>(
          VerifyPhoneNumberParam(
            phoneNumber: state.phoneNumber.value,
            codeSent: (s, _) {
              add(CodeSent(s));
            },
            verificationFailed: (error) {
              add(PhoneVerificationFailed(error));
            },
          ),
        ),
      );
    }
  }

  Stream<SignInWithPhoneState> _mapVerifySmsCodeRequested(
      String verificationId, String code) async* {
    yield state.copyWith(
        smsVerificationStatus: SmsVerificationStatus.inProgress);

    final failureOrSuccess = await _verifySmsCodeUseCaseCode(
        UseCaseParam<VerifySmsCodeParam>(
            VerifySmsCodeParam(verificationId, code)));

    yield failureOrSuccess.fold(
      (l) => state.copyWith(
          error: l.message,
          smsVerificationStatus: SmsVerificationStatus.failure),
      (r) => state.copyWith(
        smsVerificationStatus: SmsVerificationStatus.verificationSuccess,
      ),
    );
  }
}
