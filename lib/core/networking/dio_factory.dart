import 'package:dio/dio.dart';
import 'package:docdoc/core/helper/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeout = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      getDioHeaders();
      getDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void getDioHeaders() {
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void getDioInterceptors() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = CacheHelper.getUserToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            print('✅ Token added to request: $token');
          } else {
            print('⚠️ No token found, request may fail');
          }
          return handler.next(options);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
