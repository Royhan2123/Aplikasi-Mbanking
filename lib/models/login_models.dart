class LoginModels {
  final String? email;
  final String? password;

  const LoginModels({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
