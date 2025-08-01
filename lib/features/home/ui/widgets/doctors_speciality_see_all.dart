import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors Speciality',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyle(fontSize: 14.sp, color: AppColors.mainBlue),
        ),
      ],
    );
  }
}
