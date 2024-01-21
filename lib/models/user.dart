class User {
  String name;
  String id;
  String email;
  String token;
  String password;

  User({
    required this.email,
    required this.id,
    required this.name,
    required this.token,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        id: json['_id'],
        name: json['name'],
        token: json['token'] ?? '',
        password: json['password']);
  }
}
