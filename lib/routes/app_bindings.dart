


import 'package:BolilerPlate/features/authentification/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => LoginController());
  }
}

/*class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
     Get.isRegistered<CommunicationController>()
        ? Get.find<CommunicationController>()
        : Get.lazyPut(() =>CommunicationController());
  }
}

class SettingPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
class SelectLangPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectLangController());
  }
}
class ConferencePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConferenceController());
  }
}
class ChangePWDPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePWDController());
  }
}*/