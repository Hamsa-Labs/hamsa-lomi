// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../share_widgets/tabsbar_widget.dart';

// Project imports:
import '../bloc/sign_in_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInBlocState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          final errorMessage = state.error ?? 'Something went wrong!';
          final snackBar = SnackBar(content: Text(errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state.status.isSubmissionSuccess) {
          final snackBar = SnackBar(content: Text('Sign in successfull'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Enter your credentials',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            HamsaTabBar(
              tab1: TabBarView(
                children: [Text('data')],
              ),
              tab2: TabBarView(
                children: [],
              ),
              firstText: 'Tab 1',
              secondText: 'Tab 2',
            ),
            _EmailInput(),
            _PasswordInput(),
            _SignInButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInBlocState>(
      buildWhen: (previousState, state) =>
          previousState.email.value != state.email.value,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 4.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onChanged: (value) {
                  context.read<SignInBloc>().add(EmailChanged(value));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInBlocState>(
      buildWhen: (previousState, state) =>
          previousState.password.value.password !=
          state.password.value.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Password', style: Theme.of(context).textTheme.caption),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    context.read<SignInBloc>().add(PasswordChanged(value));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SignInBloc, SignInBlocState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return CircularProgressIndicator();
          }

          return ElevatedButton(
            onPressed: state.status.isValidated
                ? () {
                    context.read<SignInBloc>().add(SignInSubmitted());
                  }
                : null,
            child: Text(
              'Sign In',
              style: Theme.of(context).textTheme.button,
            ),
          );
        },
      ),
    );
  }
}
