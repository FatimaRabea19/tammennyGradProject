import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login_response_model.dart';

class AuthService {
  static const String baseUrl = 'https://665b0f70-f5bf-430c-9881-7d2d7a0cc5fa-00-1errb81jgzo99.worf.replit.dev/api/users';

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': model.email, 'password': model.password}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return LoginResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to login');
    }
  }
}

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});
}
