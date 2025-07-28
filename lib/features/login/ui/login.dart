import 'package:docdoc/core/helper/extentions.dart';
import 'package:docdoc/core/theming/app_colors.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routing/routes.dart';
import 'widgets/bloc_listen_login.dart';
import 'widgets/login_fields.dart';
import 'widgets/welcome_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeText(),
                SizedBox(height: 36.h),
                LoginFields(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.mainBlue,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                ElevatedButton(
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    minimumSize: Size(double.infinity, 52.h),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.register);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.greyText,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.mainBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BlocListenerLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginStates();
    }
  }
}
