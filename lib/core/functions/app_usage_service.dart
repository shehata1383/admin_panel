// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class AppUsageService {
  // Save items
  static Future<void> saveItems(bool items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.items, items);
  }

  // Get items
  static Future<bool?> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.items) ?? false;
  }

  // Save darkMode
  static Future<void> saveDarkMode(bool key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.key, key);
  }

  // Get darkMode
  static Future<bool?> getarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.key) ?? false;
  }

  // Save token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.TOKEN, token);
  }

  // Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.TOKEN);
  }

  // Delete token
  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.TOKEN);
  }

  // Save token
  static Future<void> saveTokenNotification(String tokenNotification) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.Notification, tokenNotification);
  }

  // Get token
  static Future<String?> getTokenNotification() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.Notification);
  }

  // Delete token
  static Future<void> deleteTokenNotification() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.Notification);
  }

  // Save IsLogin
  static Future<void> saveIsLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.ISLOGIN, isLogin);
  }

  // Get IsLogin
  static Future<bool> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.ISLOGIN) ?? false;
  }

  // Delete IsLogin
  static Future<void> deleteIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.ISLOGIN);
  }

  // Save UserId
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userId, userId);
  }

  // Get UserId
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.userId);
  }

  // Delete UserId
  static Future<void> deleteUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.userId);
  }

  // Save UserName
  static Future<void> saveUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userName, userName);
  }

  // Get UserName
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.userName);
  }

  // Delete UserName
  static Future<void> deleteUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.userName);
  }

  // Save UserEmail
  static Future<void> saveUserEmail(String userEmail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userEmail, userEmail);
  }

  // Get UserEmail
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.userEmail);
  }

  // Delete UserEmail
  static Future<void> deleteUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.userEmail);
  }

  static Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
