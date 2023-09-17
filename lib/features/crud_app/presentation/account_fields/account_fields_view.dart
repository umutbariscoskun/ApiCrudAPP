import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/presentation/account_fields/widget/account_fields_Action_button.dart';
import 'package:api_crud_app/features/crud_app/presentation/account_fields/widget/account_fields_appbar.dart';
import 'package:api_crud_app/features/crud_app/presentation/account_fields/widget/textfields_area.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountFieldsView extends StatelessWidget {
  const AccountFieldsView({
    super.key,
    required this.accountFieldsPageType,
    this.accountEntity,
    required this.homeCubit,
  }) : assert(
          accountFieldsPageType == AccountFieldsPageType.edit
              ? accountEntity != null
              : true, // continue if pageType == `AccountFieldsPageType.add`
        );
  final AccountFieldsPageType accountFieldsPageType;
  final AccountEntity? accountEntity;
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    final isPageTypeAdd = accountFieldsPageType == AccountFieldsPageType.add;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        )),
        height: context.height - 90.h,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountFieldsAppBar(isPageTypeAdd: isPageTypeAdd),
                Gap(20.h),
                TextFieldsArea(
                  accountEntity: accountEntity,
                  homeCubit: homeCubit,
                  isPageTypeAdd: isPageTypeAdd,
                ),
                Gap(40.h),
                AccountFieldsActionButton(
                  addAccountFunction: homeCubit.addAccount,
                  isPageTypeAdd: isPageTypeAdd,
                  updateAccountFunction: homeCubit.updateAccount,
                  accountEntity: accountEntity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
