// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import '../../core/form_inputs/password_input.dart';
import '../../sign_in/pages/sign_in_page.dart';
import '../bloc/create_account_bloc.dart';

// Project imports:

final sizedBox = SizedBox(
  height: 4.0,
);

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          final snackBar =
              SnackBar(content: Text('Account created successfully!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignInPage()));
        } else if (state.status.isSubmissionFailure) {
          final errorMessage = state.error ?? 'Something went wrong!';
          final snackBar = SnackBar(content: Text(errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Setup your information',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              _UsernameInput(),
              _EmailInput(),
              _PasswordInput(),
              _ConfirmPasswordInput(),
              _SignUpButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username',
                style: Theme.of(context).textTheme.caption,
              ),
              sizedBox,
              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onChanged: (value) {
                    context
                        .read<CreateAccountBloc>()
                        .add(UsernameChanged(value));
                  },
                  validator: (_) {
                    if (state.username.status == FormzInputStatus.invalid) {
                      return 'Username is required';
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
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
              sizedBox,
              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onChanged: (value) {
                    context.read<CreateAccountBloc>().add(EmailChanged(value));
                  },
                  validator: (_) {
                    if (state.email.status == FormzInputStatus.invalid) {
                      return 'Please enter a valid email address';
                    }
                  }),
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
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previousState, state) =>
          previousState.password.value.password !=
          state.password.value.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: Theme.of(context).textTheme.caption,
              ),
              sizedBox,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                validator: (_) {
                  if (state.password.error == PasswordInputError.empty) {
                    return 'Please enter your password';
                  }
                },
                onChanged: (value) {
                  context.read<CreateAccountBloc>().add(PasswordChanged(value));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatefulWidget {
  const _ConfirmPasswordInput({Key? key}) : super(key: key);

  @override
  _ConfirmPasswordInputState createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<_ConfirmPasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previousState, state) =>
          previousState.password.value != state.password.value,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm Password',
                style: Theme.of(context).textTheme.caption,
              ),
              sizedBox,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  context
                      .read<CreateAccountBloc>()
                      .add(ConfirmPasswordChanged(value));
                },
                validator: (_) {
                  if (state.password.error ==
                      PasswordInputError.confirmPasswordEmpty) {
                    return 'Please enter your confirm password.';
                  } else if (state.password.error ==
                      PasswordInputError.doesNotMatch) {
                    return 'Make sure your passwords match';
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return CircularProgressIndicator();
          } else {
            return ElevatedButton(
                onPressed: state.status.isValidated
                    ? () {
                        context
                            .read<CreateAccountBloc>()
                            .add(CreateAccountSubmitted());
                      }
                    : null,
                child: Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.button,
                ));
          }
        },
      ),
    );
  }
}
