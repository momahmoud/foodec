// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:foodec/features/home/data/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/forget_password/cubit/forget_password_cubit.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/main/cubit/main_cubit.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // onboarding
  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  // // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  // // sign_up
  // getIt
  //     .registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt<ApiService>()));
  // getIt.registerLazySingleton<SignUpCubit>(
  //     () => SignUpCubit(getIt<SignUpRepo>()));

  // // forget_password
  getIt.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit());

  // // main
  getIt.registerLazySingleton<MainCubit>(() => MainCubit());

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // // notifications
  // getIt.registerLazySingleton<NotificationsSettingCubit>(
  //     () => NotificationsSettingCubit());
}
