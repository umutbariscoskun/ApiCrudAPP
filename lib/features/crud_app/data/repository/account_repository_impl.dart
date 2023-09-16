import 'dart:async';
import 'dart:developer';

import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/features/crud_app/data/datasource/remote/account_remote_datasource.dart';
import 'package:api_crud_app/features/crud_app/data/model/account_model.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AccountRepository)
@lazySingleton
class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource _accountRemoteDataSource;

  AccountRepositoryImpl(AccountRemoteDataSource accountRemoteDataSource)
      : _accountRemoteDataSource = accountRemoteDataSource;

  @override
  Future<Either<Failure, AccountEntity>> addAccount(
      {required AccountEntity accountEntity}) async {
    try {
      // id will be assigned from api
      // we wont use id until request
      const id = '';

      final model = AccountModel(
        name: accountEntity.name,
        surname: accountEntity.surname,
        birthDate: accountEntity.birthDate,
        salary: accountEntity.salary,
        phoneNumber: accountEntity.phoneNumber,
        identityNumber: accountEntity.identityNumber,
        id: id,
      ).toMap();

      final result = await _accountRemoteDataSource.addAccount(body: model);
      // Getting and using real id from api
      final entityFromModelId = accountEntity.copyWith(id: result.id);
      return Right(entityFromModelId);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts(
      {required int page}) async {
    try {
      final entityList = <AccountEntity>[];
      final result = await _accountRemoteDataSource.getAccounts(page: page);

      for (final modelElement in result) {
        entityList.add(
          AccountEntity(
            name: modelElement.name,
            surname: modelElement.surname,
            birthDate: modelElement.birthDate,
            salary: modelElement.salary,
            phoneNumber: modelElement.phoneNumber,
            identityNumber: modelElement.identityNumber,
            id: modelElement.id,
          ),
        );
      }

      return Right(entityList);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> removeAccount(
      {required String accountEntityId}) async {
    try {
      final result =
          await _accountRemoteDataSource.removeAnAccount(id: accountEntityId);
      final entity = AccountEntity(
        name: result.name,
        surname: result.surname,
        birthDate: result.birthDate,
        salary: result.salary,
        phoneNumber: result.phoneNumber,
        identityNumber: result.identityNumber,
        id: result.id,
      );
      return Right(entity);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> updateAccount(
      {required AccountEntity accountEntity}) async {
    try {
      final id = accountEntity.id;
      final model = AccountModel(
        name: accountEntity.name,
        surname: accountEntity.surname,
        birthDate: accountEntity.birthDate,
        salary: accountEntity.salary,
        phoneNumber: accountEntity.phoneNumber,
        identityNumber: accountEntity.identityNumber,
        id: id,
      );
      final result = await _accountRemoteDataSource.updateAnAccount(
          id: id, body: model.toMap());
      // Getting and using real id from api
      final entityFromModelId = accountEntity.copyWith(id: result.id);
      return Right(entityFromModelId);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
