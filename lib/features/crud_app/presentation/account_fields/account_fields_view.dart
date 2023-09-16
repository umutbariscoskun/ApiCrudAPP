import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/core/enum/account_text_field_type.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/base_text_field.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/date_picker_factory.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/item/account_fields_page_model.dart';
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
    if (isPageTypeAdd) {
      homeCubit.accountFieldsPageModelList.addAll([
        AccountFieldsPageModel(
            hintText: isPageTypeAdd ? "Name:" : accountEntity!.name,
            onChanged: (String val) {
              homeCubit.emitTextFieldStates(
                  accountTextFieldType: AccountTextFieldType.name, value: val);
            }),
        AccountFieldsPageModel(
            hintText: "Surname:",
            onChanged: (String val) {
              homeCubit.emitTextFieldStates(
                accountTextFieldType: AccountTextFieldType.surname,
                value: val,
              );
            }),
        AccountFieldsPageModel(
          hintText: "BirthDate:",
          readOnly: true,
          onTap: () async {
            final result =
                await DatePickerFactory.showDatePickerNatively(context);
            if (result != null) {
              homeCubit.emitTextFieldStates(
                accountTextFieldType: AccountTextFieldType.surname,
                value: result.toString(),
              );
            }
          },
        ),
        AccountFieldsPageModel(
            hintText: "Salary:",
            onChanged: (String val) {
              homeCubit.emitTextFieldStates(
                accountTextFieldType: AccountTextFieldType.salary,
                value: val,
              );
            }),
        AccountFieldsPageModel(
            hintText: "PhoneNumber:",
            onChanged: (String val) {
              homeCubit.emitTextFieldStates(
                accountTextFieldType: AccountTextFieldType.phoneNumber,
                value: val,
              );
            }),
        AccountFieldsPageModel(
            hintText: "IdentityNumber:",
            onChanged: (String val) {
              homeCubit.emitTextFieldStates(
                accountTextFieldType: AccountTextFieldType.identityNumber,
                value: val,
              );
            }),
      ]);
    } else {
      if (accountEntity != null) {
        homeCubit.accountFieldsPageModelList.addAll([
          AccountFieldsPageModel(hintText: accountEntity!.name),
          AccountFieldsPageModel(hintText: accountEntity!.surname),
          AccountFieldsPageModel(
            hintText: accountEntity!.birthDate.toString(),
            readOnly: true,
            onTap: () {
              DatePickerFactory.showDatePickerNatively(context);
            },
          ),
          AccountFieldsPageModel(hintText: accountEntity!.salary.toString()),
          AccountFieldsPageModel(hintText: accountEntity!.phoneNumber),
          AccountFieldsPageModel(hintText: accountEntity!.identityNumber),
        ]);
      }
    }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isPageTypeAdd
                        ? AccountFieldsPageType.add.toString()
                        : AccountFieldsPageType.edit.toString(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                      onTap: appRouter.pop,
                      child: const Icon(
                        Icons.cancel_outlined,
                      )),
                ],
              ),
              Gap(20.h),
              BaseTextField(
                hintText: !isPageTypeAdd && accountEntity != null
                    ? accountEntity!.name
                    : locales.name,
                onChanged: (String value) => homeCubit.emitTextFieldStates(
                    accountTextFieldType: AccountTextFieldType.name,
                    value: value),
              ),
              BaseTextField(
                hintText: !isPageTypeAdd && accountEntity != null
                    ? accountEntity!.surname
                    : locales.surname,
                onChanged: (String value) => homeCubit.emitTextFieldStates(
                    accountTextFieldType: AccountTextFieldType.surname,
                    value: value),
              ),
              BaseTextField(
                hintText: locales.birthDate,
                readOnly: true,
                onTap: () async {
                  final result =
                      await DatePickerFactory.showDatePickerNatively(context);
                  homeCubit.emitTextFieldStates(
                      accountTextFieldType: AccountTextFieldType.birthDate,
                      value: result.toString());
                },
              ),
              BaseTextField(
                hintText: !isPageTypeAdd && accountEntity != null
                    ? accountEntity!.salary.toString()
                    : locales.salary,
                onChanged: (String value) => homeCubit.emitTextFieldStates(
                    accountTextFieldType: AccountTextFieldType.salary,
                    value: value),
              ),
              BaseTextField(
                hintText: !isPageTypeAdd && accountEntity != null
                    ? accountEntity!.phoneNumber
                    : locales.phoneNumber,
                onChanged: (String value) => homeCubit.emitTextFieldStates(
                    accountTextFieldType: AccountTextFieldType.phoneNumber,
                    value: value),
              ),
              BaseTextField(
                hintText: !isPageTypeAdd && accountEntity != null
                    ? accountEntity!.identityNumber
                    : locales.identityNumber,
                onChanged: (String value) => homeCubit.emitTextFieldStates(
                    accountTextFieldType: AccountTextFieldType.identityNumber,
                    value: value),
              ),
              Gap(40.h),
              GestureDetector(
                onTap: () async {
                  if (isPageTypeAdd) {
                    await homeCubit.addAccount();
                    appRouter.pop();
                  } else {
                    if (accountEntity != null) {
                      await homeCubit.updateAccount(
                          accountEntity: accountEntity!);
                    }
                  }
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.r)),
                    width: 150.w,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        isPageTypeAdd ? locales.add : locales.save,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
