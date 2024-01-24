class User {
  String name;
  String id;
  String email;
  String token;
  String password;
  bool isEmail;

  User({
    required this.email,
    required this.id,
    required this.name,
    required this.token,
    required this.isEmail,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "isEmail": false,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['_id'],
      name: json['name'],
      token: json['token'] ?? '',
      password: json['password'],
      isEmail: json['isEmail'],
    );
  }
}
