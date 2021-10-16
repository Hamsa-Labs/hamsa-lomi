import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../constants/app_assets_constant.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

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
        child: Column(
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
            Text(
              'Check Your SMS',
              style: Theme.of(context).textTheme.caption,
            ),
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: PinFieldAutoFill(
                // controller: controller,
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: FixedColorBuilder(HamsaColors.lightGray),
                ),
                onCodeSubmitted: (code) {
                },
                currentCode: _code,
                onCodeChanged: (code) {
                  if (code!.length == 6) {
                    // controller.text = code;
                    setState(() {
                      _code = code;
                    });
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
            ),
            Text(
              'Please wait for $countdown seconds',
              style: Theme.of(context).textTheme.caption,
            )
          ],
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
