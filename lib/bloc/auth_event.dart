part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(
    this.email,
  );

  @override
  List<Object> get props => [
        email,
      ];
}

class AuthRegister extends AuthEvent {
  final RegisterModels register;

  const AuthRegister(
    this.register,
  );

  @override
  List<Object> get props => [
        register,
      ];
}

class AuthLogin extends AuthEvent {
  final LoginModels login;

  const AuthLogin(
    this.login,
  );

  @override
  List<Object> get props => [
        login,
      ];
}

class AuthGetCurrentUser extends AuthEvent {}


