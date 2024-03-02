class UserFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  const UserFormModel({
    this.email,
    this.username,
    this.name,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "name": name,
        "password": password,
      };
}
