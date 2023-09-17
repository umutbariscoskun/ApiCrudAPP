import 'package:api_crud_app/features/crud_app/presentation/home/home_view.dart';
import 'package:api_crud_app/features/crud_app/presentation/splash/splash_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeView,
    ),
    AutoRoute(page: SplashView, initial: true),
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {
  AppRouter();
}
