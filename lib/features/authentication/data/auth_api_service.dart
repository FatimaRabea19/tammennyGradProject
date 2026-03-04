/*import 'dart:convert';
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


 */

/*
//import 'dart:io';
import 'package:http/http.dart' as http;
import 'register_request_model.dart';
import 'package:path/path.dart';

class RegisterApiService {
  final String baseUrl = "https://c154b827-a965-4cde-9a7f-aa625d0faa05-00-1vrgjnemcmoti.picard.replit.dev/api/users/register";

  Future<bool> registerUser(RegisterRequestModel model) async {
    try {
      var uri = Uri.parse("$baseUrl/register");

      var request = http.MultipartRequest('POST', uri);
      request.fields['fullname'] = model.fullname;
      request.fields['email'] = model.email;
      request.fields['password'] = model.password;
      request.fields['age'] = model.age.toString();
      if (model.parentEmail != null) {
        request.fields['parentEmail'] = model.parentEmail!;
      }

      if (model.image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            model.image!.path,
            filename: basename(model.image!.path),
          ),
        );
      }

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        var respStr = await response.stream.bytesToString();
        throw Exception("Failed to register: $respStr");
      }
    } catch (e) {
      throw Exception("Register error: $e");
    }
  }
}

 */














import 'package:http/http.dart' as http;
import 'register_request_model.dart';
import 'package:path/path.dart';

class RegisterApiService {
  // ✅ baseUrl بدون /register
  final String baseUrl =
      "https://c154b827-a965-4cde-9a7f-aa625d0faa05-00-1vrgjnemcmoti.picard.replit.dev/api/users";

  Future<bool> registerUser(RegisterRequestModel model) async {
    try {
      // ✅ endpoint الصحيح
      final uri = Uri.parse("$baseUrl/register");

      final request = http.MultipartRequest('POST', uri);

      // ===== Text fields =====
      request.fields['fullname'] = model.fullname;
      request.fields['email'] = model.email;
      request.fields['password'] = model.password;
      request.fields['age'] = model.age.toString();

      if (model.parentEmail != null && model.parentEmail!.isNotEmpty) {
        request.fields['parentEmail'] = model.parentEmail!;
      }

      // ===== Image field =====
      if (model.image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'avatar', // ✅ لازم نفس الاسم في backend (multer)
            model.image!.path,
            filename: basename(model.image!.path),
          ),
        );
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception("Failed to register: $responseBody");
      }
    } catch (e) {
      throw Exception("Register error: $e");
    }
  }
}
