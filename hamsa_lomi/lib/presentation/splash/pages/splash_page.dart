// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../home/page/home_page.dart';
import '../../sign_in/pages/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (state is AuthUnauthenticated) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          }
        },
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
