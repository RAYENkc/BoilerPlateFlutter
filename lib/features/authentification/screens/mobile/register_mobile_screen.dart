import 'package:BolilerPlate/config/app_colors.dart';
import 'package:BolilerPlate/config/images/app_images.dart';
import 'package:BolilerPlate/features/authentification/widgets/auth_button.dart';
import 'package:BolilerPlate/features/authentification/widgets/herder_container.dart';
import 'package:BolilerPlate/features/authentification/widgets/text_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class RegisterMobile extends StatefulWidget {
  const RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
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
                    textInputAuth(hint: "Email", icon: Icons.email),
                    textInputAuth(hint: "Phone Number", icon: Icons.call),
                    textInputAuth(hint: "Password", icon: Icons.vpn_key),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {},
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
