import 'package:flutter/material.dart';
import '../core/utils/api.dart';
import '../config/api_config.dart';

class AuthProvider with ChangeNotifier {
  Map<String, dynamic>? _user;
  bool isLoading = false;

  Map<String, dynamic>? get user => _user;

  Future<void> fetchUserProfile() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await API.get(ApiEndpoints.me);
      _user = response; // Assuming response is a JSON map
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
