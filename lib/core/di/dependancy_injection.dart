import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/home/data/repos/home_repo.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/register/data/repo/register_repo.dart';
import 'package:docdoc/features/register/logic/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/apis/home_api_service.dart';

final getIt = GetIt.instance;

Future<void> setUpGitIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // HOME
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
