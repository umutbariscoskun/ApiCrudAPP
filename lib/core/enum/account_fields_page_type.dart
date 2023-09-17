import 'package:api_crud_app/core/shared/helper_functions.dart';

enum AccountFieldsPageType {
  edit,
  add;

  @override
  String toString() {
    switch (this) {
      case AccountFieldsPageType.edit:
        return locales.editAccount;
      case AccountFieldsPageType.add:
        return locales.addAccount;
    }
  }
}
