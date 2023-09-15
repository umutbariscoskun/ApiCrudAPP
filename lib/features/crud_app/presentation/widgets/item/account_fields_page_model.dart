class AccountFieldsPageModel {
  final String hintText;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;

  const AccountFieldsPageModel({
    required this.hintText,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });
}
