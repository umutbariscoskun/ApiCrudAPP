import 'package:api_crud_app/core/constants/text_constants.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 120.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 30.h),
        child: Text(
          TextConstants.crudApp,
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
