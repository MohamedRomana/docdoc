import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/doctor_blue_container.dart';
import 'widgets/doctors_list_view.dart';
import 'widgets/doctors_speciality_list_view.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
            child: Column(
              children: [
                HomeTopBar(),
                DoctorBlueContainer(),
                SizedBox(height: 24.h),
                DoctorsSpecialitySeeAll(),
                DoctorsSpecialityListView(),
                SizedBox(height: 24.h),
                DoctorsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
