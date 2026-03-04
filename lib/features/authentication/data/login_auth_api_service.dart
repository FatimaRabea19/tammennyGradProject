import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login_response_model.dart';

class AuthService {
  static const String baseUrl = 'https://c154b827-a965-4cde-9a7f-aa625d0faa05-00-1vrgjnemcmoti.picard.replit.dev/api/users';

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
