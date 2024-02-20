

import 'package:BolilerPlate/config/app_colors.dart';
import 'package:BolilerPlate/config/app_constant.dart';
import 'package:BolilerPlate/config/styles/app_style.dart';
import 'package:BolilerPlate/core/widgets/horizontal_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ToastTypes {
  success,
  warning,
  error,
}

Future<void> showCustomToast({
  int showAfterInMilliseconds = 0,
  ToastTypes toastType = ToastTypes.success,
  required String contentText,
  double padding = 40,
  bool onTheTop = true,
  int duration = 4,
  bool blurEffectEnabled = true,
}) async {
  await Future.delayed(Duration(milliseconds: showAfterInMilliseconds));

  Get.snackbar(
    '',
    '',
    snackPosition: onTheTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
    margin: EdgeInsets.only(
      left: 20,
      right: 20,
      top: onTheTop ? padding : 0,
      bottom: onTheTop ? 0 : padding,
    ),
    overlayBlur: blurEffectEnabled ? 3 : 0,
    backgroundColor: Colors.white,
    borderColor: toastType == ToastTypes.success
        ? AppColors.green
        : toastType == ToastTypes.error
            ? AppColors.red
            : AppColors.orange,
    borderWidth: 0.6,
    boxShadows: <BoxShadow>[
      BoxShadow(
        color: toastType == ToastTypes.success
            ? AppColors.green.withOpacity(0.1)
            : toastType == ToastTypes.error
                ? AppColors.red.withOpacity(0.1)
                : AppColors.orange.withOpacity(0.1),
        spreadRadius: 4,
        blurRadius: 4,
      )
    ],
    onTap: (_) {
      Get.back();
    },
    borderRadius: AppConstants.smallRadiusValue,
    animationDuration: const Duration(milliseconds: 400),
    duration: Duration(seconds: duration),
    padding: const EdgeInsets.only(top: 10, bottom: 7),
    titleText: Row(
      children: [
        const HorizontalSpacing(12),
        Icon(
          toastType == ToastTypes.success
              ? Icons.check
              : toastType == ToastTypes.error
                  ? Icons.close
                  : Icons.warning,
          size: 28,
          color: toastType == ToastTypes.success
              ? AppColors.green
              : toastType == ToastTypes.error
                  ? AppColors.red
                  : AppColors.orange,
        ),
        const HorizontalSpacing(12),
        Flexible(
          child: Text(
            contentText,
            maxLines: 10,
            style: AppStyles.mediumDarkGrey16,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const HorizontalSpacing(16),
      ],
    ),
    messageText: const SizedBox(
      height: 0,
      width: 0,
    ),
  );
  await duration.delay();
  await Future.delayed(const Duration(milliseconds: 300));
  return;
}
