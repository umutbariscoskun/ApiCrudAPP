import 'package:api_crud_app/core/constants/color_constants.dart';
import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/core/extension/context_extension.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/presentation/account_fields/account_fields_view.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AccountItemBuilderArea extends StatelessWidget {
  const AccountItemBuilderArea({
    super.key,
    required this.cubit,
    required this.accountEntityList,
  });

  final HomeCubit cubit;
  final List<AccountEntity> accountEntityList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: cubit.scrollController,
      itemCount: accountEntityList.length,
      itemBuilder: (context, index) {
        final item = accountEntityList[index];
        return GestureDetector(
          onTap: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => AccountFieldsView(
                      homeCubit: cubit,
                      accountFieldsPageType: AccountFieldsPageType.edit,
                      accountEntity: item,
                    ));
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Dismissible(
                    onDismissed: (_) async {
                      await cubit.removeAccountEntity(
                        accountEntityId: item.id,
                      );
                    },
                    direction: DismissDirection.endToStart,
                    key: Key(item.id),
                    background: Container(
                      height: 75.w,
                      color: ColorConstants.errorColor,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: Text(locales.delete,
                              textAlign: TextAlign.right,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    child: Container(
                        decoration: const BoxDecoration(
                          color: ColorConstants.amberColor,
                        ),
                        width: context.width,
                        height: 75.h,
                        child: Center(
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                ),
              ),
              Gap(10.h)
            ],
          ),
        );
      },
    );
  }
}
