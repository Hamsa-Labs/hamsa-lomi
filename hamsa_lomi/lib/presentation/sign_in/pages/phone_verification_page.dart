// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../../constants/app_assets_constant.dart';
import '../blocs/sign_in_with_phone/sign_in_with_phone_bloc.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String verificationId;

  const PhoneVerificationPage({Key? key, required this.verificationId})
      : super(key: key);

  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  String? _code = '';
  int countdown = 30;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
      });
      if (countdown == 0) {
        timer.cancel();
      }
    });
    listenForCode();
  }

  void listenForCode() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => getIt<SignInWithPhoneBloc>(),
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: BlocListener<SignInWithPhoneBloc, SignInWithPhoneState>(
              listener: (context, state) {
                if (state.smsVerificationStatus ==
                    SmsVerificationStatus.verificationSuccess) {
                  final snackBar = SnackBar(content: Text('Success!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (state.smsVerificationStatus ==
                    SmsVerificationStatus.failure) {
                  final errorMessage = state.error ?? 'Something went wrong!';
                  final snackBar = SnackBar(content: Text(errorMessage));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: BlocBuilder<SignInWithPhoneBloc, SignInWithPhoneState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Enter Verification Code',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (countdown == 0)
                        Text(
                          'Check Your SMS',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      PinFieldAutoFill(
                        decoration: BoxLooseDecoration(
                          strokeColorBuilder:
                              FixedColorBuilder(HamsaColors.lightGray),
                        ),
                        currentCode: _code,
                        onCodeChanged: (code) {
                          _code = code;
                          if (code!.length == 6 && countdown == 0) {
                            context.read<SignInWithPhoneBloc>().add(
                                  VerifySmsCodeRequested(
                                    verificationId: widget.verificationId,
                                    code: code,
                                  ),
                                );
                          }
                        },
                      ),
                      if (countdown != 0)
                        Text(
                          'SMS will be '
                          'filled automatically in $countdown seconds.',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      if (countdown == 0)
                        Text(
                          'Automatic SMS filling failed. Fill code manually',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.red),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
