import 'package:api_crud_app/core/config/dependency_injection/injectable.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Center(
            child: GestureDetector(
              onTap: () async {
                await context.read<HomeCubit>().addAccount();
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
