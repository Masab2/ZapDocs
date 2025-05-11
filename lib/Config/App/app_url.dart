class AppUrl {
  // Base Url
  static const String baseUrl = 'http://localhost:3000/';
  // Login
  static const String login = '${baseUrl}user/login';
  // Register
  static const String register = '${baseUrl}user/register';

  // Forget Password
  static const String forgetPassword = '${baseUrl}user/send-reset-code';

  // Verify Pin
  static const String verifyPin = '${baseUrl}user/verify-reset-code';

  // Update Password
  static const String updatePassword = '${baseUrl}user/update-password';
}
