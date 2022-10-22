// ignore_for_file: no_default_cases, avoid_void_async, avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngi_repository/ngi_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    //print(event.status);
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = await _authenticationRepository.getUser();
        final companyOwner = await _authenticationRepository.getCompany();
        final childroles = await _authenticationRepository.getChildRoles();
        final permissions = await _authenticationRepository.getPermissions();
        final expirationDate =
            await _authenticationRepository.getExpirationDate();
        final userData = await _authenticationRepository.getUserData();
        return emit(
          user != null && companyOwner != null && expirationDate != null
              ? AuthenticationState.authenticated(
                  user,
                  companyOwner,
                  childroles,
                  permissions,
                  expirationDate,
                  userData,
                )
              : const AuthenticationState.unauthenticated(),
        );
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  Future<void> _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
     SocketApi.dispose();
    _authenticationRepository.logOut();
  }
}
