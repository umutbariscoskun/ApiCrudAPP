import 'dart:async';
import 'dart:developer';

import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/core/usecase/usecase.dart';
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
  Future<Either<Failure, void>> addAccount(
      {required AccountEntity accountEntity}) async {
    try {
      final id = DateTime.fromMillisecondsSinceEpoch(
              int.parse(DateTime.now().toString()))
          .toString();

      final model = AccountModel(
        name: accountEntity.name,
        surname: accountEntity.surname,
        birthDate: accountEntity.birthDate,
        sallary: accountEntity.sallary,
        phoneNumber: accountEntity.phoneNumber,
        identityNumber: accountEntity.identityNumber,
        id: id,
      ).toMap();
      return Right(await _accountRemoteDataSource.addAccount(body: model));
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts(
      {required NoParams noParams}) async {
    try {
      final entityList = <AccountEntity>[];
      final result = await _accountRemoteDataSource.getAccounts(page: 1);

      result.map(
        (e) => entityList.add(
          AccountEntity(
            name: e.name,
            surname: e.surname,
            birthDate: e.birthDate,
            sallary: e.sallary,
            phoneNumber: e.phoneNumber,
            identityNumber: e.identityNumber,
            id: e.id,
          ),
        ),
      );
      return Right(entityList);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeAccount(
      {required String accountEntityId}) async {
    try {
      final result =
          _accountRemoteDataSource.removeAnAccount(id: accountEntityId);
      return Right(result);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount(
      {required AccountEntity accountEntity}) async {
    try {
      final id = accountEntity.id;
      final modelMap = AccountModel(
        name: accountEntity.name,
        surname: accountEntity.surname,
        birthDate: accountEntity.birthDate,
        sallary: accountEntity.sallary,
        phoneNumber: accountEntity.phoneNumber,
        identityNumber: accountEntity.identityNumber,
        id: id,
      ).toMap();
      final result = await _accountRemoteDataSource.updateAnAccount(
          id: id, body: modelMap);
      return Right(result);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
