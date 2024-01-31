import 'package:BolilerPlate/config/images/app_images.dart';
import 'package:BolilerPlate/features/authentification/widgets/auth_button.dart';
import 'package:BolilerPlate/features/authentification/widgets/herder_container.dart';
import 'package:BolilerPlate/features/authentification/widgets/text_input.dart';
import 'package:BolilerPlate/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetpasswordMobile extends StatefulWidget {
  const ForgetpasswordMobile({super.key});

  @override
  State<ForgetpasswordMobile> createState() => _ForgetpasswordMobileState();
}

class _ForgetpasswordMobileState extends State<ForgetpasswordMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(children: <Widget>[
        HeaderContainer("Forgot Password", AppImages.mobileContent),
        Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Please enter the email address associated with your account",
                    textAlign: TextAlign.center,
                  ),
                  textInputAuth(hint: "Email", icon: Icons.email),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: ButtonWidget(
                      onClick: () {
                        Get.offNamed(AppRoutes.login);
                      },
                      btnText: "Next",
                    ),
                  ),
                ],
              ),
            ))
      ]),
    ));
  }
}
