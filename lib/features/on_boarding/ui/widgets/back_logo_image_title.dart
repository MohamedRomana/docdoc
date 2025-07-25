// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/app_colors.dart';

class BackLogoImageTitle extends StatelessWidget {
  const BackLogoImageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svgs/low_opacity_logo.svg',
          height: 400.w,
          width: 400.w,
          fit: BoxFit.cover,
        ),
        Image.asset('assets/images/man.png'),
        Positioned(
          bottom: 0.h,
          right: 16.w,
          left: 16.w,
          child: Container(
            height: 400.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0),
                  Colors.white,
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 315.w,
                child: Text(
                  'Best Doctor Appointment App',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
