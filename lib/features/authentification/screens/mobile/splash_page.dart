import 'dart:async';

import 'package:BolilerPlate/config/app_colors.dart';
import 'package:BolilerPlate/config/images/app_images.dart';
import 'package:BolilerPlate/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.DarkAccentColor,
              AppColors.primaryColor,
            ],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.workInProgress,
            width: 200.w,
          ),
        ),
      ),
    );
  }
}
