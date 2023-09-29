import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerFactory {
  final void Function(DateTime? dateTime) emitBirthDate;
  final initialDate = DateTime(2000);
  final maxDate = DateTime(2005);
  final minDate = DateTime(1923);

  DatePickerFactory({required this.emitBirthDate});
  Future<DateTime?> showDatePickerNatively(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _showCupertinoDatePicker(context);
    } else {
      return _showMaterialDatePicker(context);
    }
  }

  Future<DateTime?> _showCupertinoDatePicker(BuildContext context) async {
    DateTime? selectedDate;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text(locales.cancel),
                    onPressed: () {
                      emitBirthDate(selectedDate ?? initialDate);
                      appRouter.pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text(locales.done),
                    onPressed: () {
                      emitBirthDate(selectedDate ?? initialDate);

                      appRouter.pop();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  )),
              child: CupertinoDatePicker(
                  minimumDate: minDate,
                  maximumDate: maxDate,
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    selectedDate = date;
                    emitBirthDate(date);
                  }),
            ),
          ],
        );
      },
    );
    return selectedDate ?? initialDate;
  }

  Future<DateTime?> _showMaterialDatePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: minDate,
      lastDate: maxDate,
    );
    emitBirthDate(selectedDate ?? initialDate);

    return selectedDate ?? initialDate;
  }
}
