import 'dart:convert';
import 'dart:developer';
import 'package:zapdocs/Services/LocalStorage/local_storage.dart';

class SessionController {
  static final SessionController _instance = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  bool? isLogin;

  // Private constructor
  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _instance;
  }

  // Save user in shared_preferences
  Future<void> saveUserInPrefrences(dynamic user, String userId) async {
    try {
      await localStorage.setValue('isLogin', 'true');
      await localStorage.setValue('token', jsonEncode(user));
      await localStorage.setValue('id', userId);
      log("User saved with ID: $userId");
    } catch (e) {
      log("Error saving user: $e");
    }
  }

  // Get user from shared_preferences
  Future<void> getUserFromPrefrences() async {
    try {
      await localStorage.readValue('token');
      var loginStatus = await localStorage.readValue('isLogin');
      isLogin = loginStatus == "true";
      log("User loaded with login status: $isLogin");
    } catch (e) {
      log("Error loading user: $e");
    }
  }

  // Log out user and clear data from shared_preferences
  Future<void> logout() async {
    try {
      await localStorage.clearValue('isLogin');
      await localStorage.clearValue('token');
      await localStorage.clearValue('id');
      isLogin = false;
      log('User logged out successfully');
    } catch (e) {
      log("Logout failed: $e");
    }
  }
}