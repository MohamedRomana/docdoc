import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class RegisterTopText extends StatelessWidget {
  const RegisterTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Text(
          'Create Account',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.mainBlue,
          ),
        ),
        Text(
          'Enter your details below to get started',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
