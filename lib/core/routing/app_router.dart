import 'package:cookly/features/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'package:cookly/features/bottom_navbar/presentation/bottom_nav_bar.dart';
import 'package:cookly/features/categories/presentation/screens/categories_screen.dart';
import 'package:cookly/features/forget_password/cubit/forget_password_cubit.dart';
import 'package:cookly/features/forget_password/presentation/forget_password_screen.dart';
import 'package:cookly/features/home/cubit/home_cubit.dart';
import 'package:cookly/features/restaurant/presentation/view/restaurant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<BottomNavbarCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()..getCategories(),
              ),
            ],
            child: const BottomNavBar(),
          ),
        );

      case Routes.restaurantScreen:
        return MaterialPageRoute(
          builder: (_) => const RestaurantScreen(),
        );

      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );

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

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.onBoardingScreen,
      name: Routes.onBoardingScreen,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      name: Routes.forgotPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      path: Routes.mainScreen,
      name: Routes.mainScreen,
      builder: (context, state) {
        return HomeScreen();
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManger.primaryColor500,
        ),
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );
  },
  redirect: (context, state) {
    return null;
  },
  debugLogDiagnostics: true,
  initialLocation: '/',
);
