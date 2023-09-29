import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_gen/usecase_mock_gen_test.mocks.dart';

void main() {
  GetAccountsUseCase? usecase;
  AccountRepository? mockRepo;
  List<AccountEntity> list = [];
  AddAccountUseCase? usecase2;
  AccountEntity? entity;
  setUp(() {
    mockRepo = FakeRepo();
    usecase = GetAccountsUseCase(mockRepo!);

    usecase2 = AddAccountUseCase(mockRepo!);

    entity = AccountEntity(
      name: "test",
      surname: "surname",
      birthDate: DateTime(2000),
      salary: 10000,
      phoneNumber: "5055050000",
      identityNumber: "123455187128",
      id: "1",
    );
  });

  test(
    'should GET from the  repository',
    () async {
      when(mockRepo!.addAccount(accountEntity: entity!))
          .thenAnswer((_) async => Right(entity!));

      await usecase2!(AddAccountParams(accountEntity: entity!));

      list.add(entity!);

      when(mockRepo!.getAccounts(page: 1)).thenAnswer((_) async => Right(list));

      final testResult = await usecase!(GetAccountParams(page: 1));
      testResult.fold((l) => null, (r) {
        //check id
        expect(entity!.id, r.first.id);
      });
      //check response
      expect(testResult, Right(list));
    },
  );
}
