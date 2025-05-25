class ApiEndpoints {
  static const String baseUrl = "http://localhost:3001"; // Backend base URL

  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String me = "$baseUrl/auth/me";
  static const String jobs = "$baseUrl/jobs"; // Add other endpoints as needed
  static const String user =
      "$baseUrl/users/me"; // ✅ This is your profile endpoint
}
