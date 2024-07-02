import 'package:aplikasi_mbanking/models/login_models.dart';
import 'package:aplikasi_mbanking/models/register_models.dart';
import 'package:aplikasi_mbanking/models/users_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServices {
  final url = "https://bwabank.my.id/api";
  final dio = Dio();

  Future<bool> checkEmail(String email) async {
    try {
      final response = await dio.post(
        "$url/is-email-exist",
        data: {
          "email": email,
        },
      );

      if (response.statusCode == 200) {
        return response.data["is_email_exist"];
      } else {
        return response.data["errors"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UsersModels> register(RegisterModels data) async {
    try {
      final response = await dio.post(
        "$url/register",
        data: data.toJson(),
      );

      if (response.statusCode == 200) {
        UsersModels user = UsersModels.fromJson(
          response.data,
        );
        user = user.copyWith(
          password: data.password,
        );
        await storeCredentialToLocal(user);
        return user;
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UsersModels> login(LoginModels data) async {
    try {
      final response = await dio.post(
        "$url/login",
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        UsersModels user = UsersModels.fromJson(
          response.data,
        );
        user = user.copyWith(
          password: data.password,
        );
        await storeCredentialToLocal(user);
        return user;
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  // menyimpan token kredensial pengguna seperti token, email, dan password.
  Future<void> storeCredentialToLocal(UsersModels user) async {
    try {
      const storage = FlutterSecureStorage();
      storage.write(
        key: "token",
        value: user.token,
      );
      storage.write(
        key: "email",
        value: user.email,
      );
      storage.write(
        key: "password",
        value: user.password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // mengambil kredensial pengguna dari penyimpanan local
  Future<LoginModels> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, String> value = await storage.readAll();
      if (value["email"] == null || value["password"] == null) {
        throw 'authenticated';
      } else {
        final LoginModels login = LoginModels(
          email: value["email"],
          password: value["password"],
        );
        return login;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = "";

    const storage = FlutterSecureStorage();
    String? value = await storage.read(
      key: "token",
    );

    if (value != null) {
      token = value;
    }

    return token;
  }

  Future<void> clearStorage() async {
    const storage = FlutterSecureStorage();
    storage.deleteAll();
  }

  Future<void> logout() async {
    try {
      final token = await getToken();
      final response = await dio.post(
        "$url/logout",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        await clearStorage();
      } else {
        throw Exception(
          response.data["message"],
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
