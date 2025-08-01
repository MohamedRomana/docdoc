import 'package:dio/dio.dart';
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
    dio?.options.headers = {
      'Accept': 'application/json',
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzU0MDY0Mzc4LCJleHAiOjE3NTQxNTA3NzgsIm5iZiI6MTc1NDA2NDM3OCwianRpIjoiWEV3SzhxTkpzRFhWWndHOCIsInN1YiI6IjQ1ODIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.T8bkj32DXth76NwV_aFPwhWl96yuHeCHifYLTSFtnTs",
    };
  }

  static void getDioInterceptors() {
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
