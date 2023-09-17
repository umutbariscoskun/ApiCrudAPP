import 'package:api_crud_app/core/config/router/router.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/data/constants/data_constants.dart';
import 'package:api_crud_app/features/crud_app/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state.isFinished) {
                appRouter.pushAndPopUntil(
                  const HomeRoute(),
                  predicate: (route) {
                    return route.settings.name == HomeRoute.name;
                  },
                );
              }
            },
            listenWhen: (previous, current) =>
                previous.isFinished != current.isFinished,
            child: Center(
              child: LottieBuilder.asset(
                DataConstants.animationsFilePath,
                width: 200.w,
              ),
            )),
      ),
    );
  }
}
