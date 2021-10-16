part of 'sign_in_with_phone_bloc.dart';

enum PhoneVerificationStatus { pure, inProgress, codeSent, failed }
enum SmsVerificationStatus { pure, inProgress, verificationSuccess, failure }

class SignInWithPhoneState extends Equatable {
  final PhoneNumberInput phoneNumber;
  final PhoneVerificationStatus status;
  final SmsVerificationStatus smsVerificationStatus;
  final String? error;
  final String? verificationId;

  const SignInWithPhoneState(
      {this.smsVerificationStatus = SmsVerificationStatus.pure,
      this.status = PhoneVerificationStatus.pure,
      this.phoneNumber = const PhoneNumberInput.pure(),
      this.error,
      this.verificationId});

  @override
  List<Object?> get props =>
      [phoneNumber, smsVerificationStatus, status, error, verificationId];

  SignInWithPhoneState copyWith(
          {PhoneNumberInput? phoneNumber,
          PhoneVerificationStatus? status,
          String? error,
          String? verificationId,
          SmsVerificationStatus? smsVerificationStatus}) =>
      SignInWithPhoneState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        status: status ?? this.status,
        error: error ?? this.error,
        verificationId: verificationId ?? this.verificationId,
        smsVerificationStatus:
            smsVerificationStatus ?? this.smsVerificationStatus,
      );
}
