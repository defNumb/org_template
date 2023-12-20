// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated;

  String toJson() => name;

  static AuthenticationStatus fromJson(String json) => values.byName(json);
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final String? user;
  const AuthenticationState({
    required this.status,
    this.user,
  });

  factory AuthenticationState.initial() {
    // initialize the authentication service with event
    return const AuthenticationState(
      status: AuthenticationStatus.unknown,
    );
  }

  @override
  List<Object?> get props => [status, user];

  @override
  bool get stringify => true;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    String? user,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toJson(state) {
    final result = <String, dynamic>{};

    result.addAll({
      'status': state.status.toJson(),
      'user': state.user,
    });
    return result;
  }

  factory AuthenticationState.fromJson(Map<String, dynamic> json) {
    return AuthenticationState(
      status: json['status'],
      user: json['user'],
    );
  }
}
