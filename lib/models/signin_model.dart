class SignInModels {
  final String? email;
  final String? password;

  const SignInModels({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };      
}
