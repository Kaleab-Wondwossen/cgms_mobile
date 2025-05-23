//Base URL, endpoints 

const String baseUrl = "http://localhost:3001"; // Replace with your backend URL

class ApiEndpoints {
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String me = "$baseUrl/auth/me";
  // Add others like /jobs, /cv, /applications as needed
}
