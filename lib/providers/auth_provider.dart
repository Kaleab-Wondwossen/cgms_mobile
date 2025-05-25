import 'package:flutter/material.dart';
import '../config/api_config.dart';
import '../core/services/auth_service.dart';
import '../core/utils/api.dart';

class AuthProvider with ChangeNotifier {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  Map<String, dynamic>? _user;
  bool isLoading = false;

  Map<String, dynamic>? get user => _user;

  Future<bool> login(String username, String password) async {
    final success = await AuthService.login(username, password);
    _loggedIn = success;
    notifyListeners();
    return success;
  }

   // ✅ Add this method
  Future<void> fetchUserProfile() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await API.get(ApiEndpoints.me);
      _user = response;
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String username,
    required String password,
    required String birthDate,
  }) async {
    final success = await AuthService.register(
      name: name,
      email: email,
      username: username,
      password: password,
      birthDate: birthDate,
    );
    _loggedIn = success;
    notifyListeners();
    return success;
  }

  void logout() async {
    await AuthService.logout();
    _loggedIn = false;
    notifyListeners();
  }
}
