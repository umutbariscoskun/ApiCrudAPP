import 'package:api_crud_app/core/constants/text_constants.dart';
import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/base_text_field.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/item/account_fields_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountFieldsView extends StatelessWidget {
  const AccountFieldsView({
    super.key,
    required this.accountFieldsPageType,
    required this.accountFieldsPageModelList,
  });
  final AccountFieldsPageType accountFieldsPageType;

  final List<AccountFieldsPageModel> accountFieldsPageModelList;

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
              SizedBox(
                height: 350.h,
                child: ListView.builder(
                  itemCount: accountFieldsPageModelList.length,
                  itemBuilder: (context, index) {
                    final item = accountFieldsPageModelList[index];
                    return BaseTextField(
                      hintText: item.hintText,
                      onTap: item.onTap,
                      readOnly: item.readOnly ?? false,
                      onChanged: item.onChanged,
                    );
                  },
                ),
              ),
              Gap(40.h),
              GestureDetector(
                onTap: appRouter.pop,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.r)),
                    width: 150.w,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        isPageTypeAdd ? TextConstants.add : TextConstants.save,
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
