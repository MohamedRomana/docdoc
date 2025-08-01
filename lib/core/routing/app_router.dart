// ignore_for_file: unused_local_variable

import 'package:docdoc/core/di/dependancy_injection.dart';
import 'package:docdoc/features/home/logic/home_cubit.dart';
import 'package:docdoc/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/login.dart';
import '../../features/on_boarding/ui/on_boarding.dart';
import '../../features/register/logic/cubit/register_cubit.dart';
import '../../features/register/ui/register.dart';
import '../../features/splash/splash.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecialization(),
            child: Home(),
          ),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: Login(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: Register(),
          ),
        );
      default:
        return null;
    }
  }
}
