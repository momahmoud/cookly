import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/localizations/app_localizations.dart';
import 'core/localizations/cubit/locale_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors.dart';
import 'core/utils/shared_prefs.dart';

class CooklyApp extends StatefulWidget {
  const CooklyApp({super.key});

  @override
  State<CooklyApp> createState() => _CooklyAppState();
}

class _CooklyAppState extends State<CooklyApp> {
  bool isSeen = false;
  bool isLogged = false;
  final supabase = Supabase.instance.client;
  @override
  void initState() {
    getIsSeen();
    super.initState();
  }

  void getIsSeen() async {
    setState(() {
      isSeen =
          SharedPreferencesService.getData(AppConstants.onboardingSeen) != null;
    });
    if (isSeen == true) {
      supabase.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        // final Session? session = data.session;
        if (event == AuthChangeEvent.signedIn) {
          setState(() {
            isLogged = true;
          });
        } else {
          setState(() {
            isLogged = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => LocaleCubit()..getSavedLocale(),
          child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
              return MaterialApp(
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                locale: state.locale,
                localeResolutionCallback: localeResolutionCallback,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Cookly App',
                theme: ThemeData(
                  fontFamily: "DMSans",
                  // appBarTheme: const AppBarTheme(
                  //   systemOverlayStyle: SystemUiOverlayStyle(
                  //     statusBarColor: ColorsManger.neutralColor00,
                  //     statusBarBrightness: Brightness.light,
                  //     statusBarIconBrightness: Brightness.dark,
                  //   ),
                  //   elevation: 0,
                  // ),
                  primaryColor: ColorsManger.primaryColor500,
                ),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: isSeen
                    ? isLogged
                        ? Routes.mainScreen
                        : Routes.login
                    : Routes.onBoardingScreen,
              );
            },
          ),
        );
      },
    );
  }

  Locale? localeResolutionCallback(locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
