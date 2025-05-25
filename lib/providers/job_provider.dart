import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_config.dart';

class JobsProvider with ChangeNotifier {
  List<Map<String, dynamic>> _jobs = [];
  bool _loading = false;

  List<Map<String, dynamic>> get jobs => _jobs;
  bool get loading => _loading;

  Future<void> fetchJobs() async {
    _loading = true;
    notifyListeners();

    try {
      final res = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/jobs'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as List;
        _jobs = data.map((job) => job as Map<String, dynamic>).toList();
      } else {
        _jobs = [];
      }
    } catch (e) {
      debugPrint("Error fetching jobs: $e");
      _jobs = [];
    }

    _loading = false;
    notifyListeners();
  }
}
