import 'package:api_crud_app/core/constants/color_constants.dart';
import 'package:api_crud_app/core/enum/account_fields_page_type.dart';
import 'package:api_crud_app/features/crud_app/presentation/account_fields/account_fields_view.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorConstants.amberColor,
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
    );
  }
}
