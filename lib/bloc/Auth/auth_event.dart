part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckEmail extends AuthEvent {
  final String email;

  const CheckEmail(this.email);

  @override
  List<Object> get props => [email];
}
