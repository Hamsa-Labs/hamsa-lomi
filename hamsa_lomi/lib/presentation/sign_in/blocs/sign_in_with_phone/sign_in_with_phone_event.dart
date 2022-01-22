part of 'sign_in_with_phone_bloc.dart';

abstract class SignInWithPhoneEvent extends Equatable {}

class PhoneNumberChanged extends SignInWithPhoneEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class CodeSent extends SignInWithPhoneEvent {
  final String verificationId;

  CodeSent(this.verificationId);

  @override
  List<Object> get props => [];
}

class PhoneVerificationRequested extends SignInWithPhoneEvent {
  @override
  List<Object> get props => [];
}

class PhoneVerificationFailed extends SignInWithPhoneEvent {
  final String errorMessage;

  PhoneVerificationFailed(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class VerifySmsCodeRequested extends SignInWithPhoneEvent {
  final String verificationId;
  final String code;

  VerifySmsCodeRequested({required this.verificationId, required this.code});

  @override
  List<Object> get props => [verificationId, code];
}
