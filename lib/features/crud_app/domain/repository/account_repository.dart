import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository {
  Future<Either<Failure, void>> addAccount(
      {required AccountEntity accountEntity});
  Future<Either<Failure, void>> removeAccount(
      {required String accountEntityId});
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required int page});
  Future<Either<Failure, void>> updateAccount(
      {required AccountEntity accountEntity});
}
