import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/core/usecase/usecase.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AccountRepository)
@lazySingleton
class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<Either<Failure, void>> addAccount(
      {required AccountEntity accountEntity}) {
    // TODO: implement addAccount
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, List<AccountEntity>>> getAccounts(
      {required NoParams noParams}) {
    // TODO: implement getAccounts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeAccount(
      {required String accountEntityId}) {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateAccount(
      {required AccountEntity accountEntity}) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }
}
