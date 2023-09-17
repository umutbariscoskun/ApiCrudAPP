import 'package:api_crud_app/core/constants/color_constants.dart';
import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountFieldsAppBar extends StatelessWidget {
  const AccountFieldsAppBar({
    super.key,
    required this.isPageTypeAdd,
  });

  final bool isPageTypeAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: Icon(
              Icons.cancel_outlined,
              color: ColorConstants.greyColor.withOpacity(0.5),
            )),
      ],
    );
  }
}
