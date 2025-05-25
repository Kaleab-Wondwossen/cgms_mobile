import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static Future<Map<String, dynamic>> get(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token'); // Replace with your key

    final res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return json.decode(res.body);
    } else {
      throw Exception('Failed to fetch data: ${res.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    final res = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return json.decode(res.body);
    } else {
      throw Exception('POST request failed: ${res.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    final res = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return json.decode(res.body);
    } else {
      throw Exception('PUT request failed: ${res.statusCode}');
    }
  }

  static Future<void> delete(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    final res = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('DELETE request failed: ${res.statusCode}');
    }
  }
}
