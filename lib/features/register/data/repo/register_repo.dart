import 'package:docdoc/core/networking/api_results.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/register/data/models/register_request_body.dart';
import 'package:docdoc/features/register/data/models/register_response.dart';

import '../../../../core/networking/erro_handler.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ErrorHandler.handle(error));
    }
  }
}
