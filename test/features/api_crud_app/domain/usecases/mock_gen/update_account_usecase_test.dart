import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'usecase_mock_gen_test.mocks.dart';

void main() {
  UpdateAccountUseCase? useCase;
  AccountRepository? mockRepo;
  late String mockId;
  AccountEntity? entity;

  setUp(() {
    mockId = '1';

    mockRepo = FakeRepo();
    useCase = UpdateAccountUseCase(mockRepo!);

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
    'should remove from the mock repository/datasource',
    () async {
      // remove function has void return type
      // It Returns Right not failure
      when(mockRepo!.updateAccount(accountEntity: entity!))
          .thenAnswer((_) async => Right(entity!));

      final testResult =
          await useCase!(UpdateAccountParams(accountEntity: entity!));
      testResult.fold((l) => null, (r) {
        //test id
        expect(r.id, mockId);
      });
      // test response
      expect(testResult, Right(entity!));
    },
  );
}
