import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tamenny/features/authentication/data/register_request_model.dart';

class AuthApiService {
  final String baseUrl = 'https://665b0f70-f5bf-430c-9881-7d2d7a0cc5fa-00-1errb81jgzo99.worf.replit.dev/api/users';

  Future<String> register(RegisterRequestModel model) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/register'),
      );

      request.fields['fullname'] = model.fullname;
      request.fields['email'] = model.email;
      request.fields['password'] = model.password;
      request.fields['age'] = model.age.toString();
      request.fields['role'] = 'adult';

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['message'] ?? 'Registration successful';
      } else {
        var data = jsonDecode(response.body);
        throw data['error'] ?? 'Registration failed';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
