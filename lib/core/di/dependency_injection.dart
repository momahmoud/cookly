// import 'package:dio/dio.dart';
import 'package:cookly/features/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'package:cookly/features/categories/cubit/categories_cubit.dart';
import 'package:cookly/features/categories/data/repo/categories_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/forget_password/cubit/forget_password_cubit.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/onboarding/cubit/onboarding_cubit.dart';
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

  // // home
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<SupabaseClient>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
  getIt.registerLazySingleton<BottomNavbarCubit>(() => BottomNavbarCubit());

  //------------------ Categories --------------------------------//

  getIt.registerLazySingleton<CategoriesRepo>(
      () => CategoriesRepo(getIt<SupabaseClient>()));
  getIt.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getIt<CategoriesRepo>()));

  // // main
  // getIt.registerLazySingleton<MainCubit>(() => MainCubit());

  // // notifications
  // getIt.registerLazySingleton<NotificationsSettingCubit>(
  //     () => NotificationsSettingCubit());
}
