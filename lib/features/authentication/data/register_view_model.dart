import 'package:flutter/material.dart';
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
