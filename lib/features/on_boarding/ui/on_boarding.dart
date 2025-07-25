import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/back_logo_image_title.dart';
import 'widgets/desc_and_button.dart';
import 'widgets/logo_and_text_row.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                LogoAndTextRow(),
                SizedBox(height: 41.h),
                BackLogoImageTitle(),
                DescAndButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
