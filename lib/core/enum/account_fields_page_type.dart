import 'package:api_crud_app/core/constants/text_constants.dart';

enum AccountFieldsPageType {
  edit,
  add;

  @override
  String toString() {
    switch (this) {
      case AccountFieldsPageType.edit:
        return TextConstants.editAccount;
      case AccountFieldsPageType.add:
        return TextConstants.addAccount;
    }
  }
}
