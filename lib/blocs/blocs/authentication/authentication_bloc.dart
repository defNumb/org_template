// ignore: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../services/authentication.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;
  AuthenticationBloc(this._authenticationService)
      : super(AuthenticationState.initial()) {
    // login event
    on<AuthenticationSignInRequested>((event, emit) async {
      final user =
          await _authenticationService.login(event.email, event.password);
      if (user != null) {
        emit(state.copyWith(
            status: AuthenticationStatus.authenticated, user: user));
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });

    // authentication services
    on<AuthenticationRegisterRequested>((event, emit) async {
      await _authenticationService.init();
    });
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    // print where this is coming from
    print('Auth from storage: $json');
    final authState = AuthenticationState.fromJson(json);
    print(authState);
    return authState;
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    // print where this is coming from
    print('Auth to storage: $state');
    final authState = state.toJson(state);
    print(authState);
    return authState;
  }
}
