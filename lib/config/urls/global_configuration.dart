import 'package:flutter/cupertino.dart';

enum Environnement { dev, preprod, prod, local }

class GlobalConfiguration {
  static const Iterable<Locale> supportedLocales = <Locale>[
    Locale('de', 'DE'),
  ];

  static bool debugModeEnabled = false;

  static Environnement environnement = Environnement.preprod;

  static String get baseUrl {
    switch (environnement) {
      case Environnement.preprod:
        return 'https://backend-boilerplate.ccdev.space/';

      case Environnement.prod:
        return '';

      case Environnement.local:
        return 'http://192.168.1.189:62727/';

      default:
        return 'https://backend-boilerplate.ccdev.space/';
    }
  }

  static void enableTestMode() {
    debugModeEnabled = true;
  }

  static void disableTestMode() {
    debugModeEnabled = false;
  }
}
