// ignore_for_file: avoid_void_async

/*  The LoginBloc manages the state of the LoginForm and takes care
validating the username and password input as well as the state of the form.
The LoginBloc is responsible for reacting to user interactions in the LoginForm
and handling the validation and submission of the form.
The LoginBloc has a dependency on the AuthenticationRepository
because when the form is submitted, it invokes logIn.
The initial state of the bloc is pure meaning neither the inputs
nor the form has been touched or interacted with.

Whenever either the username or password change,
the bloc will create a dirty variant of the Username/Password model
and update the form status via the Formz.validate API.

When the LoginSubmitted event is added,
if the current status of the form is valid,
the bloc makes a call to logIn and updates the status
based on the outcome of the request.
*/

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:gdm_bloc/login/login.dart';
import 'package:ngi_repository/ngi_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      try {
        final loginResponse = await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        if (loginResponse.success == true) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              error: 'Login failed. Please try again.'));
        }
      } catch (e, stack) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            error: e.toString() + ' ' + stack.toString()));

        print(e);
        print(stack);
      }
    }
  }
}
