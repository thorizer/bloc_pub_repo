part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/* In this application there are three different LoginEvent types:

LoginUsernameChanged: notifies the bloc that the username has been modified.
LoginPasswordChanged: notifies the bloc that the password has been modified.
LoginSubmitted: notifies the bloc that the form has been submitted. */

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
