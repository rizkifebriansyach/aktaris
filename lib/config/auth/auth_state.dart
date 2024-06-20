

import '../../data/model/auth/auth_model.dart';

enum AppType { INITIAL, FIRST_INSTALL, UNAUTHENTICATED, AUTHENTICATED }

class AuthState {
  final User? user;
  final AppType appStatus;

  const AuthState({this.user, this.appStatus = AppType.INITIAL});

  AuthState copyWith({
    User? user,
    AppType? appStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      appStatus: appStatus ?? this.appStatus,
    );
  }
}