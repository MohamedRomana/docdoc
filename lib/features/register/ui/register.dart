import 'package:docdoc/core/helper/extentions.dart';
import 'package:docdoc/core/theming/app_colors.dart';
import 'package:docdoc/features/register/logic/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/cubit/register_cubit.dart';
import 'widgets/register_fields.dart';
import 'widgets/register_top_text.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterTopText(),
                RegisterFields(),
                ElevatedButton(
                  onPressed: () {
                    validateThenDoRegister(context);
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
                RegisterListner(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates();
    }
  }
}

class RegisterListner extends StatelessWidget {
  const RegisterListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.mainBlue),
              ),
            );
          },
          success: (registerResponse) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(registerResponse.message),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
          error: (error) {
            context.pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error)));
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
