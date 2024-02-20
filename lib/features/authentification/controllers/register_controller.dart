import 'package:BolilerPlate/config/app_constant.dart';
import 'package:BolilerPlate/core/helpers/base_controller.dart';
import 'package:BolilerPlate/core/helpers/requests_interceptor.dart';
import 'package:BolilerPlate/core/services/register_service.dart';
import 'package:BolilerPlate/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

class RegisterController extends BaseController {
  RegisterService registerService = RegisterService();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  bool isPasswordContainsUpperLowerNumberSpecialChar = false;
  bool isPasswordValid = false;
  String uuidUser = "";

  Future<bool> register() async {
    bool registrationSuccess = false;

    try {
      // Register user and get UUID
      Map<String, dynamic> registerResult = await registerService.register(
        email: emailTEC.text,
        password: passwordTEC.text,
      );

      uuidUser = registerResult["id"];

      registrationSuccess = true;
    } catch (error) {
      DioRequestsInterceptor.hideLoader();
      showCustomToast(
        contentText: AppConstants.DOUBEL_EMAIL,
        toastType: ToastTypes.error,
      );
    }

    // Return the registration success status
    return registrationSuccess;
  }
}
