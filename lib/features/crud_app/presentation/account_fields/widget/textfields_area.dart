import 'package:api_crud_app/core/enum/account_text_field_type.dart';
import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:api_crud_app/features/crud_app/data/constants/data_constants.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/cubit/home_cubit.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/base_text_field.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/date_picker_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldsArea extends StatefulWidget {
  const TextFieldsArea({
    super.key,
    required this.accountEntity,
    required this.homeCubit,
    required this.isPageTypeAdd,
  });
  final AccountEntity? accountEntity;
  final bool isPageTypeAdd;
  final HomeCubit homeCubit;

  @override
  State<TextFieldsArea> createState() => _TextFieldsAreaState();
}

class _TextFieldsAreaState extends State<TextFieldsArea> {
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseTextField(
          hintText: !widget.isPageTypeAdd && widget.accountEntity != null
              ? widget.accountEntity!.name
              : locales.name,
          onChanged: (String value) => widget.homeCubit.emitTextFieldStates(
              accountTextFieldType: AccountTextFieldType.name, value: value),
        ),
        BaseTextField(
          hintText: !widget.isPageTypeAdd && widget.accountEntity != null
              ? widget.accountEntity!.surname
              : locales.surname,
          onChanged: (String value) => widget.homeCubit.emitTextFieldStates(
              accountTextFieldType: AccountTextFieldType.surname, value: value),
        ),
        BaseTextField(
          hintText: result.isNotEmpty
              ? result
              : !widget.isPageTypeAdd && widget.accountEntity != null
                  ? widget.accountEntity!.birthDate.toString()
                  : locales.birthDate.toString(),
          readOnly: true,
          onTap: () async {
            final date = await DatePickerFactory(
              emitBirthDate: widget.homeCubit.emitBirthDate,
            ).showDatePickerNatively(context);
            setState(() {
              result = date.toString();
            });
          },
        ),
        BaseTextField(
          hintText: !widget.isPageTypeAdd && widget.accountEntity != null
              ? widget.accountEntity!.salary.toString()
              : locales.salary,
          onChanged: (String value) => widget.homeCubit.emitTextFieldStates(
              accountTextFieldType: AccountTextFieldType.salary, value: value),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(
                RegExp(DataConstants.numberRegExp)),
          ],
        ),
        BaseTextField(
          hintText: !widget.isPageTypeAdd && widget.accountEntity != null
              ? widget.accountEntity!.phoneNumber
              : locales.phoneNumber,
          onChanged: (String value) => widget.homeCubit.emitTextFieldStates(
              accountTextFieldType: AccountTextFieldType.phoneNumber,
              value: value),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(
                RegExp(DataConstants.numberRegExp)),
          ],
        ),
        BaseTextField(
          hintText: !widget.isPageTypeAdd && widget.accountEntity != null
              ? widget.accountEntity!.identityNumber
              : locales.identityNumber,
          onChanged: (String value) => widget.homeCubit.emitTextFieldStates(
              accountTextFieldType: AccountTextFieldType.identityNumber,
              value: value),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(
                RegExp(DataConstants.numberRegExp)),
          ],
        ),
      ],
    );
  }
}
