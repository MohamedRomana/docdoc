import 'package:docdoc/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, John',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'How Are you Today?',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.greyText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.greyText.withAlpha(30),
          child: const Icon(Icons.notifications_outlined, color: Colors.black),
        ),
      ],
    );
  }
}
