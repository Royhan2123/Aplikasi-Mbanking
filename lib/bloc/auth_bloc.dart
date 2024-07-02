import 'package:aplikasi_mbanking/models/login_models.dart';
import 'package:aplikasi_mbanking/models/register_models.dart';
import 'package:aplikasi_mbanking/models/users_models.dart';
import 'package:aplikasi_mbanking/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmail) {
          try {
            emit(
              AuthLoading(),
            );
            final res = await AuthServices().checkEmail(
              event.email,
            );

            if (res == false) {
              emit(
                AuthCheckEmailSucces(),
              );
            } else {
              emit(
                const AuthFailed(
                  "Email yang anda gunakan sudah anda pakai",
                ),
              );
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthLogin) {
          try {
            emit(
              AuthLoading(),
            );
            final res = await AuthServices().login(
              event.login,
            );
            emit(
              AuthSucces(res),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthRegister) {
          try {
            emit(
              AuthLoading(),
            );

            final res = await AuthServices().register(
              event.register,
            );

            emit(
              AuthSucces(res),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
