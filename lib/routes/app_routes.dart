class AppRoutes {
  AppRoutes._();
   //! splash
  static const String splash = '/splash';

  //! Authentication
  static const String login = '/login';

  //!Change password
  static const String register = '/register';

  //! Home
  static const String home = '/home';

  //! Profile
  static const String profile = '/profile';
  static const String profilePage = '/() => ProfilePage';

  //! settings
  static const String forgetPassword = '/forgetPassword';
  static const String settingsPage = '/() => SettingsPage';

  //! settingsLng
  static const String settingsLang = '/selectLangPage';
  static const String conferencePage = '/confeencePage';
  static const String settingsLangPage = '/() => SelectLangPage';
}