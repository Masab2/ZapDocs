class AppUrl {
  // Base Url For IOS
  // static const String baseUrl = 'http://localhost:3000/';
  // Local Base Url For Android Emulator
  static const String baseUrl = 'http://192.168.0.177:3000/';
  // Production Url
  // static const String baseUrl = 'https://zap-docs-backend.vercel.app/';
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

  // Generate Notes Url
  static const String generateNotes = '${baseUrl}api/summerize-notes';

  // Import Notes From Url
  static const String importNotesFromUrl = '${baseUrl}api/summerize-notes-with-url';

  // Delete My Account
  static const String deleteMyAccount = '${baseUrl}user/delete-user';

  // get notes
  static String getNotes(userId) =>
      '${baseUrl}api/get-all-notes?userId=$userId';
}
