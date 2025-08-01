import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/app_colors.dart';
import '../logic/home_state.dart';
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
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is SpecializationLoading ||
                      current is SpecializationSuccess ||
                      current is SpecializationError,
                  builder: (context, state) {
                    debugPrint('STATE IS: ${state.runtimeType}');
                    return state.maybeWhen(
                      specializationLoading: () {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainBlue,
                          ),
                        );
                      },
                      specializationSuccess: (specializations) {
                        var specializationList = specializations;
                        return Column(
                          children: [
                            DoctorsSpecialityListView(
                              specializationDataList: specializationList ?? [],
                            ),
                          ],
                        );
                      },
                      orElse: () => Text("State Not Matched"),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is DoctorSuccess || current is DoctorError,
                  builder: (context, state) {
                    return state.maybeWhen(
                      doctorSuccess: (doctorsList) {
                        return DoctorsListView(doctorsList: doctorsList ?? []);
                      },
                      doctorError: (error) => Text(error),
                      orElse: () => Text("State Not Matched"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
