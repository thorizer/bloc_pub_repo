// ignore_for_file: lines_longer_than_80_chars

/* The LoginForm handles notifying the LoginBloc of user events
and also responds to state changes using BlocBuilder and BlocListener.

BlocListener is used to show a SnackBar if the login submission fails.
In addition, BlocBuilder widgets are used to wrap each of the TextField widgets
and make use of the buildWhen property in order to optimize for rebuilds.
The onChanged callback is used to notify the LoginBloc of changes
to the username/password.

The _LoginButton widget is only enabled if the status of the form is valid
and a CircularProgressIndicator is shown in its place while the form
is being submitted.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gdm_bloc/login/widgets/rounded_input.dart';
import 'package:gdm_bloc/login/widgets/rounded_password_input.dart';
import 'package:gdm_bloc/login/login.dart';
import 'package:gdm_bloc/shared/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final Size size;
  final double defaultLoginSize;
  @override
  Widget build(BuildContext context) {
    context.select(
      (LoginBloc bloc) => bloc.state.error,
    );
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure && state.error.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                  content: Text(
                    state.error,
                    style: TextStyle(fontSize: 10),
                  ),
                  backgroundColor: Colors.redAccent),
            );
        } else if (state.message.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(

                  content: Text(
                    state.message,
                    style: TextStyle(fontSize: 10),
                  ),
                  backgroundColor: Colors.green),
            );
        }
      },
      child: Align(
        child: SizedBox(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'NGI Tracker',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),

                const SizedBox(height: 20),

                //SvgPicture.asset('assets/images/login.svg', height: size.height * 0.4),

                Image.asset('assets/images/login/ngi.png',
                    height: size.height * 0.4),

                const SizedBox(height: 20),

                _UsernameInput(),

                _PasswordInput(),

                const SizedBox(height: 10),

                _LoginButton(),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return RoundedInput(
          key: const Key('loginForm_usernameInput_textField'),
          icon: Icons.mail,
          hint: 'Username',
          //label: 'Username',
          error: state.username.invalid ? '❌ Invalid Username' : null,
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return RoundedPasswordInput(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          error: state.password.invalid ? '❌ Invalid Password' : null,
          hint: 'Password',
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InkWell(
                key: const Key('loginForm_continue_raisedButton'),
                onTap: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: state.status.isValidated
                        ? kPrimaryColor
                        : kDisabledColor,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
