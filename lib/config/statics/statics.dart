import 'package:BolilerPlate/core/helpers/local_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:BolilerPlate/core/models/user_model.dart';
import 'package:BolilerPlate/routes/app_routes.dart';
import 'package:get/get.dart';

class Statics {
  Statics._();

  static UserModel? loggedUser;
  static bool isLoggedIn = false;
  static bool modalIsDisplayed = false;
  static String? fcmToken;

  static void eraseLoggedUserInformations() {
    loggedUser = null;
    isLoggedIn = false;
    fcmToken = null;
  }

  static void saveLoggedUserToken({required UserModel userModel}) {
    loggedUser = userModel;
    isLoggedIn = true;
  }

  static void clearAllDataUserAndLogin() async {
    eraseLoggedUserInformations();
    await FirebaseMessaging.instance.deleteToken();
    LocalStorageController localStorageController = Get.find();
    localStorageController.clearStorage(() {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
