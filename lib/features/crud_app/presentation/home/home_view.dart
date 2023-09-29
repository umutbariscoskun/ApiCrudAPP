import 'package:api_crud_app/core/config/dependency_injection/injectable.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/widget/account_builder.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/widget/add_floating_action_button.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/widget/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();

              return Scaffold(
                floatingActionButton: AddFloatingActionButton(cubit: cubit),
                body: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: context.width,
                      height: context.height,
                      child: Column(
                        children: [
                          const HeaderText(),
                          if (state.homeStatus != HomeStatus.success)
                            Padding(
                              padding: EdgeInsets.only(top: 250.h),
                              child: const _LoadingIndicator(),
                            ),
                          if (state.homeStatus == HomeStatus.success)
                            Expanded(
                              child: AccountItemBuilderArea(
                                cubit: cubit,
                                accountEntityList: state.accountEntityList,
                              ),
                            ),
                        ],
                      ),
                    ),

                    ///Pagination loading
                    if (state.scrollIsLoading) const _LoadingIndicator(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
