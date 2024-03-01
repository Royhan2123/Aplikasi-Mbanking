// ignore_for_file: file_names

class SignUpModels {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final int? pin;
  final String? profilePicture;
  final String? ktp;

  const SignUpModels({
    this.id,
    this.name,
    this.pin,
    this.email,
    this.profilePicture,
    this.ktp,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "pin": pin,
        "profilePicture": profilePicture,
        "ktp": ktp,
        "password": password,
      };
}
