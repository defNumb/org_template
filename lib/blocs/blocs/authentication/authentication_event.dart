part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

// sign out
class AuthenticationSignOutRequested extends AuthenticationEvent {}

// sign in
class AuthenticationSignInRequested extends AuthenticationEvent {
  const AuthenticationSignInRequested(
      {required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

// register services event
class AuthenticationRegisterRequested extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
