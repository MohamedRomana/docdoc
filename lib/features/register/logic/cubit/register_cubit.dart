import 'package:docdoc/core/networking/api_results.dart';
import 'package:docdoc/features/register/data/models/register_request_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/register_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(RegisterState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitRegisterStates() async {
    emit(RegisterState.loading());
    final response = await _registerRepo.register(
      RegisterRequestBody(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      error: (error) {
        emit(RegisterState.error(error: error.apiErrorModel.message ?? ""));
      },
    );
  }
}
