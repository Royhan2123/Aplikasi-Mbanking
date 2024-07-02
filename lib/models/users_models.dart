class UsersModels {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final int? balance;
  final String? cardNumber;
  final String? token;
  final String? pin;
  final String? password;

  UsersModels({
    this.id,
    this.name,
    this.email,
    this.username,
    this.verified,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.token,
    this.pin,
    this.password,
  });
  

  UsersModels copyWith({
    String? name,
    String? email,
    String? username,
    int? balance,
    String? pin,
    String? password,
  }) {
    return UsersModels(
      id: id ,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      verified: verified,
      profilePicture: profilePicture,
      balance: balance ?? this.balance,
      cardNumber: cardNumber,
      token: token,
      pin: pin ?? this.pin,
      password: password ?? this.password,
    );
  }

  factory UsersModels.fromJson(Map<String, dynamic> map) {
    return UsersModels(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      username: map['username'],
      verified: map['verified'],
      profilePicture: map['profile_picture'],
      balance: map['balance'],
      cardNumber: map['card_number'],
      token: map['token'],
      pin: map['pin'],
      password: map['password'],
    );
  }
}
