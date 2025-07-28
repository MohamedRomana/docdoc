import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/login/data/model/login_request_body.dart';
import '../../features/login/data/model/login_response.dart';
import '../../features/register/data/models/register_request_body.dart';
import '../../features/register/data/models/register_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<RegisterResponse> register(@Body() RegisterRequestBody registerRequestBody);
}