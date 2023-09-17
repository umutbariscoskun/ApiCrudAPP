import 'package:api_crud_app/core/shared/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerFactory {
  static Future<DateTime?> showDatePickerNatively(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _showCupertinoDatePicker(context);
    } else {
      return _showMaterialDatePicker(context);
    }
  }

  static Future<DateTime?> _showCupertinoDatePicker(
      BuildContext context) async {
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
                      Navigator.of(builderContext).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text(locales.done),
                    onPressed: () {
                      Navigator.of(builderContext).pop(selectedDate);
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
                  maximumDate: DateTime(2005),
                  initialDateTime: DateTime(2000),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {}),
            ),
          ],
        );
      },
    );
    return selectedDate;
  }

  static Future<DateTime?> _showMaterialDatePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1923),
      lastDate: DateTime(2005),
    );
    return selectedDate;
  }
}
