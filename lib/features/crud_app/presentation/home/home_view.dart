import 'package:api_crud_app/core/config/dependency_injection/injectable.dart';
import 'package:api_crud_app/core/constants/color_constants.dart';
import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:api_crud_app/features/crud_app/presentation/account_fields/account_fields_view.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () {
                    showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => AccountFieldsView(
                              homeCubit: cubit,
                              accountFieldsPageType: AccountFieldsPageType.add,
                            ));
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                body: SizedBox(
                  width: context.width,
                  height: context.height,
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.width,
                        height: 150.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 30.h),
                          child: Text(
                            "CRUD APP",
                            style: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.accountEntityList.length,
                          itemBuilder: (context, index) {
                            final item = state.accountEntityList[index];
                            return GestureDetector(
                              onTap: () {
                                showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => AccountFieldsView(
                                          homeCubit: cubit,
                                          accountFieldsPageType:
                                              AccountFieldsPageType.edit,
                                          accountEntity: item,
                                        ));
                              },
                              child: Dismissible(
                                onDismissed: (_) async {
                                  await cubit.removeAccountEntity(
                                    accountEntityId: item.id,
                                  );
                                },
                                direction: DismissDirection.endToStart,
                                key: Key(item.id),
                                background: Container(
                                  color: ColorConstants.errorColor,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 30.w),
                                      child: const Text('Delete',
                                          textAlign: TextAlign.right,
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: SizedBox(
                                      width: context.width,
                                      height: 75.h,
                                      child: Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
