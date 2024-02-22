import 'package:BolilerPlate/config/app_colors.dart';
import 'package:BolilerPlate/config/images/app_images.dart';
import 'package:BolilerPlate/features/authentification/widgets/auth_button.dart';
import 'package:BolilerPlate/features/authentification/widgets/herder_container.dart';
import 'package:BolilerPlate/features/authentification/widgets/text_input.dart';
import 'package:BolilerPlate/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/app_constant.dart';
import '../../../../core/helpers/requests_interceptor.dart';
import '../../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.find();
  final _textFieldsformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: AppColors.primaryColor,
        body: Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          HeaderContainer("Login", AppImages.loginBackgorund),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Form(
                  key: _textFieldsformKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      textInputAuth(
                          controller: controller.emailTEC,
                          hint: "Email ",
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email),
                      textInputAuth(
                          controller: controller.passwordTEC,
                          hint: "Password",
                          obscureText: controller.passwordIsHidden,
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                controller.passwordIsHidden =
                                    !controller.passwordIsHidden;
                              });
                            },
                            icon: Icon(
                              controller.passwordIsHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          icon: Icons.vpn_key),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.forgetPassword);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Forgot Password?",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: ButtonWidget(
                            onClick: () {
                              DioRequestsInterceptor.showLoader();
                              final bool validInputs =
                                  _textFieldsformKey.currentState!.validate();
                              if (validInputs) {
                                _login();
                              } else {
                                DioRequestsInterceptor.hideLoader();
                              }
                            },
                            btnText: "LOGIN",
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "Don't have an account ? ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: "Registor",
                            style:
                                const TextStyle(color: AppColors.primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(AppRoutes.register);
                              },
                          ),
                        ]),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }

  void _login() {
    // UsefullMethods.unfocus(context);
    AppConstants.halfSecond.then((_) {
      controller.signIn();
      DioRequestsInterceptor.hideLoader();
    });
  }
}
