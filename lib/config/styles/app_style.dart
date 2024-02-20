import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class AppStyles {
  AppStyles._();
  //Font families
  static const String _fontFamily = 'Poppins';

  //Font weights
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;

  /* Font sizes */
  //static const double smallestTextSize = 9.0;
  static const double smallTextSize = 10.0;
  static double lightTextSize = 12.sp;
  static double normalTextSize = 14.sp;
  static double mediumTextSize = 16.sp;
  static double largeTextSize = 18.sp;
  static double largestTextSize = 20.sp;
  static double xLargestTextSize = 36.sp;
  static double xxLargestTextSize = 32.sp;
  static double xsLargestTextSize = 24.sp;

  static TextStyle errorStyle = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.red,
    fontWeight: _semiBold,
    fontSize: lightTextSize,
    fontStyle: FontStyle.italic,
  );

  static TextStyle regularDark16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.DarkAccentColor,
    fontWeight: _regular,
    fontSize: mediumTextSize,
  );

  static TextStyle regularBlue16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue,
    fontWeight: _regular,
    fontSize: mediumTextSize,
  );

  static TextStyle regularDarkGrey14 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.darkestGrey,
    fontWeight: _regular,
    fontSize: normalTextSize,
  );
  static TextStyle regularBlack14 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.darkPrimaryColor,
    fontWeight: _regular,
    fontSize: normalTextSize,
  );

  static TextStyle regularBlack16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.darkPrimaryColor,
    fontWeight: _regular,
    fontSize: mediumTextSize,
  );
  static TextStyle mediumBlack14 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
    fontWeight: _medium,
    fontSize: normalTextSize,
  );

  static TextStyle regularDarkGray12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.DarkGray,
    fontWeight: _regular,
    fontSize: lightTextSize,
  );
  static TextStyle regularDarkGray14 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.DarkGray,
    fontWeight: _regular,
    fontSize: normalTextSize,
  );
  static TextStyle mediumDarkGrey16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.colorDarkGray,
    fontWeight: _medium,
    fontSize: mediumTextSize,
  );

  static TextStyle mediumDarkGrey12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.colorDarkGray,
    fontWeight: _medium,
    fontSize: mediumTextSize,
  );

  static TextStyle mediumprimaryColor12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _medium,
    fontSize: lightTextSize,
  );

  static TextStyle regularredColor16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.redBtn,
    fontWeight: _regular,
    fontSize: mediumTextSize,
  );

  static TextStyle regularblueColor16 = TextStyle(
    fontFamily: _fontFamily,
    color: const Color.fromRGBO(44, 103, 255, 1),
    fontWeight: _regular,
    fontSize: mediumTextSize,
  );
  /*static  TextStyle mediumDarkGrey12WithShadow = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.colorDarkGray,
    fontWeight: _medium,
    fontSize: mediumTextSize,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8.0,
        color: AppColors.orange,
      ),
    ],
  );*/

  static TextStyle boldBlue16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue,
    fontWeight: _bold,
    fontSize: mediumTextSize,
  );

  static TextStyle mediumboldBlue12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue,
    fontWeight: _bold,
    fontSize: mediumTextSize,
  );
  static TextStyle semiboldBlue12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue,
    fontWeight: _semiBold,
    fontSize: mediumTextSize,
  );

  static TextStyle inactiveMediumBlue14 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue.withOpacity(0.4),
    fontWeight: _medium,
    fontSize: largestTextSize,
  );
  static TextStyle inactiveMediumBlue13 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue.withOpacity(0.4),
    fontWeight: _medium,
    fontSize: largeTextSize,
  );

  static TextStyle inactiveBoldBlue12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue.withOpacity(0.4),
    fontWeight: _bold,
    fontSize: mediumTextSize,
  );

  static TextStyle inactiveRegularBlue12 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blue.withOpacity(0.4),
    fontWeight: _regular,
    fontSize: mediumTextSize,
  );

  static TextStyle mediumWhite18 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.white,
    fontWeight: _medium,
    fontSize: largeTextSize,
  );

  static TextStyle regularWhite18 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.white,
    fontWeight: _regular,
    fontSize: largeTextSize,
  );

  static TextStyle mediumBlack20 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.darkPrimaryColor,
    fontWeight: _medium,
    fontSize: largestTextSize,
  );

  static TextStyle semiBoldBlack36 = TextStyle(
      fontFamily: _fontFamily,
      color: AppColors.DarkAccentColor,
      fontWeight: _semiBold,
      fontSize: xLargestTextSize);

  static TextStyle semiBoldPrimary36 = TextStyle(
      fontFamily: _fontFamily,
      color: AppColors.primaryColor,
      fontWeight: _semiBold,
      fontSize: xLargestTextSize);

  static TextStyle semiBoldBlackPrimary36 = TextStyle(
      fontFamily: _fontFamily,
      color: AppColors.darkPrimaryColor,
      fontWeight: _semiBold,
      fontSize: xxLargestTextSize);

  static TextStyle mediumBlack12 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
    fontWeight: _medium,
    fontSize: normalTextSize,
  );

  static TextStyle mediumBlack16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.darkPrimaryColor,
    fontWeight: _medium,
    fontSize: mediumTextSize,
  );

  static TextStyle regularWhite14 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.white,
    fontWeight: _regular,
    fontSize: normalTextSize,
  );
  static TextStyle boldWhite24 = TextStyle(
      fontFamily: _fontFamily,
      color: Colors.white,
      fontWeight: _semiBold,
      fontSize: xsLargestTextSize);

  static TextStyle boldBlack24 = TextStyle(
      fontFamily: _fontFamily,
      color: Colors.black,
      fontWeight: _bold,
      fontSize: largestTextSize);

  static TextStyle semiboldBlack14 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
    fontWeight: _semiBold,
    fontSize: normalTextSize,
  );
  static TextStyle mediumWhite16 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.white,
    fontWeight: _medium,
    fontSize: mediumTextSize,
  );

  static TextStyle semiBoldBlack16 = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.black,
    fontWeight: _semiBold,
    fontSize: mediumTextSize,
  );
  static TextStyle largboldBlack22 = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
    fontWeight: _bold,
    fontSize: xLargestTextSize,
  );
}
