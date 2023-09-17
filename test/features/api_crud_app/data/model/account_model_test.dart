import 'package:api_crud_app/features/crud_app/data/model/account_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final AccountModel testModel = AccountModel(
    name: "test",
    surname: "surname",
    birthDate: DateTime(2000),
    salary: 10000,
    phoneNumber: "5055050000",
    identityNumber: "123455187128",
    id: "1",
  );

  test('should be a subclass of a model', () async {
    expect(testModel, isA<AccountModel>());
  });
}
