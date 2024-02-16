import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodec/features/main/cubit/main_cubit.dart';
import 'package:foodec/features/main/presentation/main_screen.dart';

import '../../features/forget_password/cubit/forget_password_cubit.dart';
import '../../features/forget_password/presentation/forget_password_screen.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/presentation/login_screen.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../di/dependency_injection.dart';
import '../theme/colors.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: const OnBoardingScreen(),
          ),
        );

      // case Routes.settings:
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<MainCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()
                  ..getSlides()
                  ..getCategories(),
              ),
            ],
            child: const MainScreen(),
          ),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );

      // case Routes.notificationsSetting:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<NotificationsSettingCubit>(),
      //       child: const NotificationsSettingScreen(),
      //     ),
      //   );

      // case Routes.notifications:
      //   return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      // case Routes.register:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignUpCubit>(),
      //       child: const SignUpScreen(),
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              backgroundColor: ColorsManger.primaryColor500,
            ),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
