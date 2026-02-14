class ApiEndpoints {
  // Base URL
  static const String baseUrl = 'https://api.example.com/v1';
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration connectionTimeout = Duration(seconds: 15);

  // Auth Routes
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // User Routes
  static const String userProfile = '/user/profile';
}
