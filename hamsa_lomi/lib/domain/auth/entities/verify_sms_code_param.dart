// Package imports:
import 'package:equatable/equatable.dart';

class VerifySmsCodeParam extends Equatable {
  final String verificationId;
  final String smsCode;

  VerifySmsCodeParam(this.verificationId, this.smsCode);

  @override
  List<Object?> get props => [verificationId, smsCode];
}
