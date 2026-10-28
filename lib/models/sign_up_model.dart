class SignUpModel {
  String username;
  String email;
  String password;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, Object?> json) {
    return SignUpModel(
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}
