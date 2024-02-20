


import 'package:BolilerPlate/features/authentification/controllers/login_controller.dart';
import 'package:BolilerPlate/features/authentification/controllers/register_controller.dart';
import 'package:BolilerPlate/features/home/controllers/Home_controller.dart';
import 'package:get/get.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => LoginController());
  }
}

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
   /*  Get.isRegistered<CommunicationController>()
        ? Get.find<CommunicationController>()
        : Get.lazyPut(() =>CommunicationController());*/
  }
}

class RegisterPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
