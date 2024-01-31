import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';


class AppConstants {
  AppConstants._();

  static const String CGU_URL =
      'https://translatly.de/index.php/coockies-policy/';
  static const String Police_URL = 'https://translatly.de/coockies-policy/';
  static const String EMAIL = 'email';
  static const String PASSWORD = 'pwd';
  static const String USER = 'user';
  static const String FCM_TOKEN = 'FCM_TOKEN';
  static const String REQUIRED_FIELD = 'Dieses Feld ist obligatorisch!';
  static const String ERROR_OCCURED = 'Ein Fehler ist aufgetreten';
  static const String DOUBEL_EMAIL = 'Duplizierte E-Mail';

  static const String androidDefaultDownloadDirectory =
      '/storage/emulated/0/Download';

  /* Input Controlls */
  static const String numberedAndAccentuedRegExp =
      '[\' a-zA-Z0-9\u002E\u2212\u207B\u02D7\u005F\u00C7\u00E7\u00C9\u00E9\u00EA\u00C8\u00E8\u02C6\u00E5\u00E0\u00DB\u00FB\u00D9\u00F9\u00C2\u00E2\u00C6\u00E6\u00C0\u00CA\u00EE\u00CE\u00CF\u00EF\u00D4\u00F4]';
  static const String accentuedRegExp =
      '[\' a-zA-Z\u002E\u2212\u207B\u02D7\u005F\u00C7\u00E7\u00C9\u00E9\u00EA\u00C8\u00E8\u02C6\u00E5\u00E0\u00DB\u00FB\u00D9\u00F9\u00C2\u00E2\u00C6\u00E6\u00C0\u00CA\u00EE\u00CE\u00CF\u00EF\u00D4\u00F4]';

  static Future<bool> quarterSecond = 0.25.delay().then((_) => false);
  static Future<bool> halfSecond = 0.5.delay().then((_) => false);
  static Future<bool> oneSecond = 1.delay().then((_) => false);
  static Future<bool> twoSeconds = 2.delay().then((_) => false);
  static Future<bool> threeSeconds = 3.delay().then((_) => false);
  static Future<bool> fourSeconds = 4.delay().then((_) => false);
  static Future<bool> fiveSeconds = 10.delay().then((_) => false);
  static Future<bool> falseFutrue = 0.delay().then((_) => false);
  static Future<bool> oneMinute = 60.delay().then((_) => false);

  /* Widget heights */
  static const double defaultAppBarHeight = 55.0;
  static const double extendedAppBarHeight = 120.0;
  static const double minimalTextFieldHeight = 40;
  static const double maximumTextFieldHeight = 47;
  static const double minimalButtonHeight = 30;
  static double regularButtonHeight = 44.sp;
  static const double maximumButtonHeight = 45;
  static const double cardButtonsSize = 35;

  /* Paddings */
  static const double _smallPaddingValue = 10;
  static const double _normalPaddingValue = 15;
  static const double _mediumPaddingValue = 20;
  static const double _largePaddingValue = 30;

  static const EdgeInsets smallPadding = EdgeInsets.symmetric(
    horizontal: _smallPaddingValue,
  );
  static const EdgeInsets normalPadding = EdgeInsets.symmetric(
    horizontal: _normalPaddingValue,
  );
  static const EdgeInsets mediumPadding = EdgeInsets.symmetric(
    horizontal: _mediumPaddingValue,
  );
  static const EdgeInsets largePadding = EdgeInsets.symmetric(
    horizontal: _largePaddingValue,
  );

  /* Default Border radius */
  static const double smallestRadiusValue = 7.0;
  static const double smallRadiusValue = 10.0;
  static const double regularRadiusValue = 20.0;
  static const double largeRadiusValue = 40.0;

  static const Radius smallestRadius = Radius.circular(smallestRadiusValue);
  static const Radius smallRadius = Radius.circular(smallRadiusValue);
  static const Radius regularRadius = Radius.circular(regularRadiusValue);
  static const Radius largeRadius = Radius.circular(largeRadiusValue);

  static const BorderRadius smallestBorderRadius =
      BorderRadius.all(smallestRadius);
  static const BorderRadius smallBorderRadius = BorderRadius.all(smallRadius);
  static const BorderRadius regularBorderRadius =
      BorderRadius.all(regularRadius);
  static const BorderRadius largeBorderRadius = BorderRadius.all(largeRadius);
}
