import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../config/api_config.dart';

class AuthService {
  static const storage = FlutterSecureStorage();

  static Future<bool> login(String username, String password) async {
    final res = await http.post(
      Uri.parse(ApiEndpoints.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': username, 'password': password}),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      await storage.write(key: "token", value: data['token']);
      return true;
    }
    return false;
  }

  static Future<bool> register({
    required String name,
    required String email,
    required String username,
    required String password,
    required String birthDate,
  }) async {
    try {
      final payload = {
        'name': name,
        'email': email,
        'username': username,
        'password': password,
        'birth_date': birthDate,
        'role': 'job_seeker',
      };

      debugPrint("Register payload: $payload");

      final res = await http.post(
        Uri.parse(ApiEndpoints.register),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      debugPrint("REGISTER RESPONSE: ${res.statusCode}");
      debugPrint("BODY: ${res.body}");

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        await storage.write(key: "token", value: data['token']);
        return true;
      }

      return false;
    } catch (e) {
      debugPrint("REGISTER ERROR: $e");
      return false;
    }
  }

  static Future<void> logout() async {
    await storage.delete(key: "token");
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
}
