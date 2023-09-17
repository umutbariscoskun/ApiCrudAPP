import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_gen/usecase_mock_gen_test.mocks.dart';

void main() {
  AddAccountUseCase? useCase;
  AccountRepository? mockRepo;
  AccountEntity? entity;

  setUp(() {
    mockRepo = FakeRepo();
    useCase = AddAccountUseCase(mockRepo!);

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
    'The entity sent as a parameter and the entity returned as a response should be exactly the same; they should not be different.',
    () async {
      when(mockRepo!.addAccount(accountEntity: entity!))
          .thenAnswer((_) async => Right(entity!));
      // act
      final result = await useCase!(AddAccountParams(accountEntity: entity!));

      // assert
      expect(result, Right(entity));
    },
  );
}
