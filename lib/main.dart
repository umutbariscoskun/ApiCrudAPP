import 'package:api_crud_app/core/environment_banner.dart';
import 'package:api_crud_app/core/config/dependency_injection/injectable.dart';
import 'package:api_crud_app/core/config/observer/route_observer.dart';
import 'package:api_crud_app/core/env.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/data/constants/data_constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        DataConstants.enLocale,
        DataConstants.trLocale,
      ],
      path: DataConstants.translationsFilePath,
      fallbackLocale: DataConstants.enLocale,
      child: EnvironmentBanner(
          message: EnvironmentConfig.currentEnvironment.toUpperCase(),
          child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(390, 844),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          child: MaterialApp.router(
            // theme: AppThemeData.lightTheme,
            // darkTheme: AppThemeData.darkTheme,
            // themeMode: ThemeMode.light,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [
                RouteObservers(),
              ],
            ),
          ),
        );
      },
    );
  }
}
