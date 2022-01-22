// Package imports:
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef PhoneVerificationFailed = Function(String error);

class VerifyPhoneNumberParam extends Equatable {
  final String phoneNumber;
  final PhoneCodeSent codeSent;
  final PhoneVerificationFailed verificationFailed;

  VerifyPhoneNumberParam(
      {required this.verificationFailed,
      required this.phoneNumber,
      required this.codeSent});

  @override
  List<Object?> get props => [phoneNumber];
}
