import 'package:flutter/material.dart';
import '../core/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<bool> login(String username, String password) async {
    final success = await AuthService.login(username, password);
    _loggedIn = success;
    notifyListeners();
    return success;
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
