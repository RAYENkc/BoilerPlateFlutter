


import 'dart:convert';

import 'package:BolilerPlate/core/helpers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_constant.dart';
import '../../../config/statics/statics.dart';
import '../../../core/helpers/local_storage.dart';
import '../../../core/services/user_service.dart';
import '../../../core/widgets/custom_toast.dart';
import '../../../routes/app_routes.dart';

class LoginController extends BaseController {
  final UserService _service = UserService();
  String email = '';
  String password = '';

  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  bool passwordIsHidden = true;
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  void signIn() async {

      _service
          .signIn(
              email: emailTEC.text,
              password: passwordTEC.text,
              )
          .then(
        (bool success) async {
          if (success) {
         //   final LocalStorageController localStorageController = Get.find();

         /*   await localStorageController.saveObjectToStorage(AppConstants.USER,
                json.encode(Statics.loggedUser!.toMap()).toString());*/
            Get.offAllNamed(AppRoutes.home);
          } else {
            showCustomToast(
              toastType: ToastTypes.error,
              contentText:
                  'The connection failed, check your settings',
              onTheTop: false,
            );
          }
        },
      );
    }
  
}