
class ErrorResponse {
  final String name;
  final String message;
  final int code;

  ErrorResponse({required this.message, required this.name, required this.code});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      name: json['name'],
      code: json['code'],
      message: json['message'],
    );
  }

}