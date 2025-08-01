import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class DoctorsSpecialityListView extends StatefulWidget {
  final List<SpecializationData?> specializationDataList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationDataList,
  });

  @override
  State<DoctorsSpecialityListView> createState() =>
      _DoctorsSpecialityListViewState();
}

class _DoctorsSpecialityListViewState extends State<DoctorsSpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        itemCount: widget.specializationDataList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationDataList[index]?.id ?? 0,
              );
            },
            child: Container(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 0.w : 3.w,
                top: 10.h,
              ),
              child: Column(
                children: [
                  index == selectedSpecializationIndex
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.mainBlue),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.greyText.withAlpha(30),
                            radius: 30.r,
                            child: Image.asset(
                              'assets/images/man.png',
                              fit: BoxFit.cover,
                              height: 40.w,
                              width: 40.w,
                            ),
                          ),
                        )
                      : CircleAvatar(
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
                    widget.specializationDataList[index]?.name ?? '',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
