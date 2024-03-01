class UsersModels {
  final int? id;
  final String? name;
  final String? email;
  final String? userName;
  final int? verified;
  final String? profilePicture;
  final String? cardNumber;
  final int? balance;
  final String? pin;
  final String? password;
  final String? token;

  const UsersModels({
    this.email,
    this.id,
    this.name,
    this.password,
    this.userName,
    this.verified,
    this.profilePicture,
    this.cardNumber,
    this.balance,
    this.pin,
    this.token,
  });

  factory UsersModels.fromJson(Map<String, dynamic> json) => UsersModels(
      name: json["name"],
        id: json["id"],
        email: json["email"],
        userName: json["username"],
        verified: json["verified"],
        profilePicture: json["profile_picture"],
        pin: json["pin"],
        balance: json["balance"],
        cardNumber: json["card_number"],
        token: json["token"],
        password: json["password"],
  );

   UsersModels copyWith({
    String? name,
    String? userName,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UsersModels(
        id: id,
        cardNumber: cardNumber,
        verified: verified,
        profilePicture: profilePicture,
        token: token,
        email: email ?? this.email,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
      );
}
