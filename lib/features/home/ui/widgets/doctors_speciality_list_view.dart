import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationData?> specializationDataList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        itemCount: specializationDataList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) => Container(
          padding: EdgeInsetsDirectional.only(
            start: index == 0 ? 0.w : 3.w,
            top: 10.h,
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.greyText.withAlpha(30),
                radius: 30.r,
                child: Image.asset(
                  'assets/images/man.png',
                  fit: BoxFit.cover,
                  height: 40.w,
                  width: 40.w,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                specializationDataList[index]?.name ?? '',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
