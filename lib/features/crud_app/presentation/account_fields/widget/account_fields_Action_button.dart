import 'package:api_crud_app/core/constants/color_constants.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountFieldsActionButton extends StatelessWidget {
  const AccountFieldsActionButton({
    super.key,
    required this.isPageTypeAdd,
    required this.accountEntity,
    required this.homeCubit,
  });

  final bool isPageTypeAdd;
  final AccountEntity? accountEntity;

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final validate = homeCubit.validate();
        if (validate) {
          if (isPageTypeAdd) {
            await homeCubit.addAccount();
          } else {
            if (accountEntity != null) {
              await homeCubit.updateAccount(accountEntity: accountEntity!);
            }
          }
          await appRouter.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    locales.pleaseFillEmptyAreas,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: ColorConstants.amberColor,
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
    );
  }
}
