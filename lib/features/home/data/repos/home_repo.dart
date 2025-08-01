import 'package:docdoc/core/networking/api_results.dart';
import 'package:flutter/material.dart';
import '../../../../core/networking/erro_handler.dart';
import '../apis/home_api_service.dart';
import '../models/specialization_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error, stackTrace) {
      debugPrint('❌ Caught error in repo: $error');
      debugPrint('📌 StackTrace: $stackTrace');
      return ApiResult.error(ErrorHandler.handle(error));
    }
  }
}
