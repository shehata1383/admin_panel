// ignore_for_file: constant_identifier_names

import '../model/language_model.dart';

String? shareLink;

class AppConstants {
  static const String appName = 'eilajaa';
  static const double appVersion = 1.0;

  static const String fontFamily = 'Almarai';
  static const String key = "isDarkMode";
  static const String items = "items";

  static const String userId = 'userId';
  static const String ISLOGIN = 'ISLOGIN';
  static const String userName = 'userName';
  static const String userEmail = 'userEmail';

  // Shared Key
  static const String THEME = 'eilajaa_theme';
  static const String TOKEN = 'eilajaa_token';
  static const String Notification = 'eilajaa_tokenNotification';
  static const String COUNTRY_CODE = 'eilajaaCountry_code';
  static const String LANGUAGE_CODE = 'eilajaaLanguage_code';

  static List<LanguageModel> languages = [
    LanguageModel(languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
  ];
}
