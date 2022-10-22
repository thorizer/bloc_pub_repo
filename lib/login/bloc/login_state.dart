/*  The LoginState will contain
the status of the form as well as the username and password input states. */

part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.error = '',
    this.message = '',
  });

  final FormzStatus status;
  final Username username;
  final Password password;
  final String error;
  final String message;

  LoginState copyWith({
    FormzStatus? status,
    String? error,
    Username? username,
    Password? password,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,

      username: username ?? this.username,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, error, username, password, message];
}
