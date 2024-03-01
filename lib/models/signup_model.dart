// ignore_for_file: file_names
class SignUpModels {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  const SignUpModels({
    required this.name,
    this.pin,
    required this.email,
    this.profilePicture,
    this.ktp,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "pin": pin,
        "profilePicture": profilePicture,
        "ktp": ktp,
        "password": password,
      };

  SignUpModels copyWith({
    String? pin,
    String? ktp,
    String? profilePicture,
  }) =>
      SignUpModels(
        email: email,
        name: name,
        password: password,
        pin: pin ?? this.pin,
        ktp: ktp ?? this.ktp,
        profilePicture: profilePicture ?? this.profilePicture,
      );
}
