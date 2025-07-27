import 'package:docdoc/core/networking/erro_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_results.freezed.dart';
@Freezed()
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.error(ErrorHandler errorHandler) = Failure<T>;
}