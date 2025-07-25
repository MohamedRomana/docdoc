import 'package:docdoc/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';

class DescAndButton extends StatelessWidget {
  const DescAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          width: 343.w,
          child: Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.sp, color: AppColors.greyText),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.login);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              minimumSize: Size(311.w, 52.h),
            ),
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
