import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../logic/cubit/register_cubit.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isObscure = true;
  bool isObscure2 = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasNumeric = false;
  bool hasLongEnough = false;
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    registerpassValid();
    super.initState();
  }

  void registerpassValid() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumeric = AppRegex.hasNumber(passwordController.text);
        hasLongEnough = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          SizedBox(height: 20.h),
          TextFormField(
            controller: cubit.nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: 'name',
              labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: cubit.phoneController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: 'phone',
              labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
          SizedBox(height: 16.h),

          TextFormField(
            controller: cubit.emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
          SizedBox(height: 16.h),

          TextFormField(
            controller: cubit.passwordController,
            obscureText: isObscure,

            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  !isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey),
              ),

              labelText: 'password',
              labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
          SizedBox(height: 16.h),

          TextFormField(
            controller: cubit.confirmPasswordController,
            obscureText: isObscure2,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  !isObscure2 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isObscure2 = !isObscure2;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: 'confirm password',
              labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
          SizedBox(height: 20.h),

          RegisterPasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialChar: hasSpecialChar,
            hasNumeric: hasNumeric,
            hasLongEnough: hasLongEnough,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class RegisterPasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialChar;
  final bool hasNumeric;
  final bool hasLongEnough;
  const RegisterPasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialChar,
    required this.hasNumeric,
    required this.hasLongEnough,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        registerValidation('At least 8 characters', hasLongEnough),
        registerValidation('At least 1 lowercase letter', hasLowerCase),
        registerValidation('At least 1 uppercase letter', hasUpperCase),
        registerValidation('At least 1 number', hasNumeric),
        registerValidation('At least 1 special character', hasSpecialChar),
      ],
    );
  }

  registerValidation(text, bool validated) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: validated ? Colors.green : Colors.red,
          radius: 2.r,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: validated ? Colors.green : Colors.red,
            decoration: validated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
