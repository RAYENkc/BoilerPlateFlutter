import 'package:BolilerPlate/config/app_colors.dart';
import 'package:BolilerPlate/config/images/app_images.dart';
import 'package:BolilerPlate/core/helpers/requests_interceptor.dart';
import 'package:BolilerPlate/core/widgets/custom_toast.dart';
import 'package:BolilerPlate/features/authentification/widgets/auth_button.dart';
import 'package:BolilerPlate/features/authentification/widgets/herder_container.dart';
import 'package:BolilerPlate/features/authentification/widgets/text_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../controllers/register_controller.dart';

class RegisterMobile extends StatefulWidget {
  const RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  final RegisterController _controllerRegister = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Register", AppImages.undrawSignUp),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    textInputAuth(hint: "Fullname", icon: Icons.person),
                    textInputAuth(
                        controller: _controllerRegister.emailTEC,
                        hint: "Email",
                        icon: Icons.email),
                    textInputAuth(hint: "Phone Number", icon: Icons.call),
                    textInputAuth(
                      controller: _controllerRegister.passwordTEC,
                      hint: "Password",
                      icon: Icons.vpn_key,
                      onChanged: (value) {
                        setState(() {
                          // Check if password is at least 8 characters long
                          _controllerRegister.isPasswordValid =
                              _controllerRegister.passwordTEC.text.length >= 8;

                          // Check if password contains uppercase letter, lowercase letter, number, and special character
                          RegExp regex =
                              RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

                          _controllerRegister
                                  .isPasswordContainsUpperLowerNumberSpecialChar =
                              regex.hasMatch(
                                  _controllerRegister.passwordTEC.text);
                        });
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () async {
                            if (_controllerRegister.isPasswordValid &&
                                _controllerRegister
                                    .isPasswordContainsUpperLowerNumberSpecialChar) {
                              DioRequestsInterceptor.showLoader();
                              final bool registrationSuccess =
                                  await _controllerRegister.register();

                              if (registrationSuccess) {
                              DioRequestsInterceptor.hideLoader();
                                Get.offNamed(AppRoutes.home);
                              }
                            } else {
                              showCustomToast(
                                toastType: ToastTypes.error,
                                contentText: 'Complete all the information',
                                onTheTop: true,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: "Login",
                          style: const TextStyle(color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAllNamed(AppRoutes.login);
                            },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
