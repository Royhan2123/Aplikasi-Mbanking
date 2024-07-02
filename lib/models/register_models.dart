// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModels {
  final String? profilePicture;
  final String? email;
  final String? name;
  final String? password;
  final String? pin;
  final String? ktp;
  RegisterModels({
   required this.name,
   required this.email,
   required this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'pin': pin,
        'profile_picture': profilePicture,
        'ktp': ktp,
      };

  RegisterModels copyWith({
    String? profilePicture,
    String? pin,
    String? ktp,
  }) {
    return RegisterModels(
      profilePicture: profilePicture ?? this.profilePicture,
      email: email,
      name: name,
      password: password,
      pin: pin ?? this.pin,
      ktp: ktp ?? this.ktp,
    );
  }
}
