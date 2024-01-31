import 'package:BolilerPlate/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderContainer extends StatelessWidget {
  var text = "Login";
  var imageName = "loginBackgorund";

  HeaderContainer(this.text, this.imageName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.DarkAccentColor,
            AppColors.primaryColor,
          ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: SvgPicture.asset(
              imageName,
              width: 200.w,
            ),
          ),
        ],
      ),
    );
  }
}
