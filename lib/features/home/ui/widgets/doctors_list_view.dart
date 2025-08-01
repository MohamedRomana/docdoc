import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class DoctorsListView extends StatelessWidget {
  final List<DoctorsList?> doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctorsList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => Container(
        height: 100.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: AppColors.greyText.withAlpha(30),
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage('assets/images/man.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorsList[index]?.name ?? '',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    '${doctorsList[index]?.degree} | ${doctorsList[index]?.phone}',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyText,
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.amber,
                        size: 14.sp,
                      ),
                      Text(
                        '4.5 (200 reviews)',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
