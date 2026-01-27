class LoginResponseModel {
  final bool success;
  final String message;
  final String? token;
  final Map<String, dynamic>? user;

  LoginResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['status'] == 'success',
      message: json['message'],
      token: json['data']?['token'],
      user: json['data']?['user'],
    );
  }
}
