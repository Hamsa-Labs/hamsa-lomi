import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/params/use_case_param.dart';
import '../../../../domain/sign_in/entities/verify_phone_number_param.dart';
import '../../../../domain/sign_in/use_cases/verify_phone_number_use_case.dart';
import '../../../core/form_inputs/phone_number_input.dart';

part 'sign_in_with_phone_event.dart';
part 'sign_in_with_phone_state.dart';

@injectable
class SignInWithPhoneBloc
    extends Bloc<SignInWithPhoneEvent, SignInWithPhoneState> {
  final VerifyPhoneNumberUseCase _verifyPhoneNumber;

  SignInWithPhoneBloc(this._verifyPhoneNumber) : super(SignInWithPhoneState());

  @override
  Stream<SignInWithPhoneState> mapEventToState(
    SignInWithPhoneEvent event,
  ) async* {
    if (event is PhoneNumberChanged) {
      yield _mapPhoneNumberChangedToState(state, event.phoneNumber);
    } else if (event is PhoneVerificationRequested) {
      yield* _mapPhoneVerifcationRequestedToState(state);
    } else if (event is CodeSent) {
      yield state.copyWith(status: PhoneVerificationStatus.codeSent);
    } else if (event is PhoneVerificationFailed) {
      yield state.copyWith(
          status: PhoneVerificationStatus.failed, error: event.errorMessage);
    }
  }

  SignInWithPhoneState _mapPhoneNumberChangedToState(
      SignInWithPhoneState state, String phoneNumber) {
    return state.copyWith(
      phoneNumber: PhoneNumberInput.dirty(phoneNumber),
    );
  }

  Stream<SignInWithPhoneState> _mapPhoneVerifcationRequestedToState(
      SignInWithPhoneState state) async* {
    if (state.phoneNumber.valid) {
      yield state.copyWith(status: PhoneVerificationStatus.inProgress);

      await _verifyPhoneNumber(
        UseCaseParam<VerifyPhoneNumberParam>(
          VerifyPhoneNumberParam(
            phoneNumber: state.phoneNumber.value,
            codeSent: (s, _) {
              add(CodeSent());
            },
            verificationFailed: (error) {
              add(PhoneVerificationFailed(error));
            },
          ),
        ),
      );
    }
  }
}
