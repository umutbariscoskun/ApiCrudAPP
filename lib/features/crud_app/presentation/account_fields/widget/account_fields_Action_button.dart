import 'package:api_crud_app/core/constants/color_constants.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountFieldsActionButton extends StatelessWidget {
  const AccountFieldsActionButton({
    super.key,
    required this.isPageTypeAdd,
    required this.updateAccountFunction,
    required this.addAccountFunction,
    required this.accountEntity,
  });

  final bool isPageTypeAdd;
  final AccountEntity? accountEntity;
  final Future<void> Function({required AccountEntity accountEntity})
      updateAccountFunction;
  final Future<void> Function() addAccountFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isPageTypeAdd) {
          await addAccountFunction();
        } else {
          if (accountEntity != null) {
            await updateAccountFunction(accountEntity: accountEntity!);
          }
        }
        await appRouter.pop();
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
