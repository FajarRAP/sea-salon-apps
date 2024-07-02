part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginAuthenticating extends AuthState {}

class LoginAuthenticated extends AuthState {
  final User user;

  LoginAuthenticated(this.user);
}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

class RegisterAuthenticating extends AuthState {}

class RegisterAuthenticated extends AuthState {}

class RegisterError extends AuthState {
  final String message;

  RegisterError(this.message);
}

class SessionDestroying extends AuthState {}

class SessionDestroyed extends AuthState {}
