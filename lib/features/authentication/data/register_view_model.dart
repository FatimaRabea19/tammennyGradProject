/*import 'package:flutter/material.dart';
import 'package:tamenny/features/authentication/data/auth_api_service.dart';
import 'package:tamenny/features/authentication/data/register_request_model.dart';


class RegisterViewModel extends ChangeNotifier {
  final AuthApiService _authApiService = AuthApiService();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> register(RegisterRequestModel model) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      await _authApiService.register(model);

      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}


 */













import 'package:flutter/material.dart';
import 'register_request_model.dart';
import 'auth_api_service.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  final RegisterApiService apiService = RegisterApiService();

  Future<bool> register(RegisterRequestModel model) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final success = await apiService.registerUser(model);
      isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}