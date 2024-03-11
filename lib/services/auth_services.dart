import 'package:aplikasi_mbanking/models/signin_model.dart';
import 'package:aplikasi_mbanking/models/signup_model.dart';
import 'package:aplikasi_mbanking/models/users_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {
  String baseUrl = "https://bwabank.my.id/api/";
  final dio = Dio();

  Future<SignUpModels> checkEmail(String email) async {
    try {
      final response = await dio.post(
        "$baseUrl/is-email-exist",
        data: {
          "email": email,
        },
      );

      if (response.statusCode == 200) {
        return response.data["is-email-exist"];
      } else {
        return response.data["errors"];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UsersModels> signUp(SignUpModels data) async {
    try {
      final response = await dio.post(
        "$baseUrl/register",
        data: {
          data.toJson(),
        },
      );

      if (response.statusCode == 200) {
        UsersModels user = UsersModels.fromJson(response.data);
        user = user.copyWith(password: data.password);
        return user;
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UsersModels> signIn(SignInModels data) async {
    try {
      final response = await dio.post(
        "$baseUrl/login",
        data: {
          data.toJson(),
        },
      );
      if (response.statusCode == 200) {
        UsersModels user = UsersModels.fromJson(response.data);
        user.copyWith(password: data.password);
        return user;
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }


  // send token crendetial to local
  Future<void> storeCredentialToLocal(UsersModels user) async {
    try {
      const storage = FlutterSecureStorage();

      await storage.write(key: "token", value: user.token);
      await storage.write(key: "email", value: user.email);
      await storage.write(key: "password", value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  // get token credential from local
}
