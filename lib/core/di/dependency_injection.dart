// import 'package:dio/dio.dart';
import 'package:cookly/features/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'package:cookly/features/categories/cubit/categories_cubit.dart';
import 'package:cookly/features/categories/data/repo/categories_repo.dart';
import 'package:cookly/features/restaurant/data/repo/restaurant_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/forget_password/cubit/forget_password_cubit.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
import '../../features/restaurant/presentation/cubit/restaurant_cubit.dart';
import '../networking/supabase_factory.dart';
// import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  // Dio dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  SupabaseClient supabaseClient = await SupabaseFactory.getDio();
  getIt.registerLazySingleton<SupabaseClient>(() => supabaseClient);

  // onboarding
  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  // // login
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<SupabaseClient>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  // // sign_up
  // getIt
  //     .registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt<ApiService>()));
  // getIt.registerLazySingleton<SignUpCubit>(
  //     () => SignUpCubit(getIt<SignUpRepo>()));

  // // forget_password
  getIt.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit());

  //------------------ Categories --------------------------------//
  getIt.registerLazySingleton<CategoriesRepoImpl>(
      () => CategoriesRepoImpl(getIt<SupabaseClient>()));
  getIt.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getIt<CategoriesRepoImpl>()));

  //------------------ Restaurants --------------------------------//

  getIt.registerLazySingleton<RestaurantRepoImpl>(
      () => RestaurantRepoImpl(getIt<SupabaseClient>()));
  getIt.registerFactory<RestaurantCubit>(
      () => RestaurantCubit(getIt<RestaurantRepoImpl>()));

  // // home
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(
        getIt<CategoriesRepoImpl>(),
        getIt<RestaurantRepoImpl>(),
      ));
  getIt.registerLazySingleton<BottomNavbarCubit>(() => BottomNavbarCubit());

  // // main
  // getIt.registerLazySingleton<MainCubit>(() => MainCubit());

  // // notifications
  // getIt.registerLazySingleton<NotificationsSettingCubit>(
  //     () => NotificationsSettingCubit());
}
