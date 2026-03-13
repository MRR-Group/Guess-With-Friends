
class LoginResponse {
  final String token;
  final String id;

  LoginResponse({required this.token, required this.id});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      id: json['user_id'],
    );
  }
}