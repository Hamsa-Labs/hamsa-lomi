part of 'sign_in_with_phone_bloc.dart';

enum PhoneVerificationStatus { pure, inProgress, codeSent, failed }

class SignInWithPhoneState extends Equatable {
  final PhoneNumberInput phoneNumber;
  final PhoneVerificationStatus status;
  final String? error;

  const SignInWithPhoneState(
      {this.status = PhoneVerificationStatus.pure,
      this.phoneNumber = const PhoneNumberInput.pure(),
      this.error});

  @override
  List<Object?> get props => [phoneNumber, status, error];

  SignInWithPhoneState copyWith(
          {PhoneNumberInput? phoneNumber,
          PhoneVerificationStatus? status,
          String? error}) =>
      SignInWithPhoneState(
          phoneNumber: phoneNumber ?? this.phoneNumber,
          status: status ?? this.status,
          error: error ?? this.error);
}
