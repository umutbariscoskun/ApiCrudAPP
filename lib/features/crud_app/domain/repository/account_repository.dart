import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/core/usecase/usecase.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository {
  Future<Either<Failure, void>> addAccount(
      {required AccountEntity accountEntity});
  Future<Either<Failure, void>> removeAccount(
      {required String accountEntityId});
  Stream<Either<Failure, List<AccountEntity>>> getAccounts(
      {required NoParams noParams});
  Future<Either<Failure, void>> updateAccount(
      {required AccountEntity accountEntity});
}
