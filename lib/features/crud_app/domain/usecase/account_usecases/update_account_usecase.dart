part of 'account_usecases.dart';

@immutable
@injectable

///Updates an account
class UpdateAccountUseCase extends UseCase<AccountEntity, UpdateAccountParams> {
  final AccountRepository _accountRepository;

  UpdateAccountUseCase(this._accountRepository);
  @override
  Future<Either<Failure, AccountEntity>> call(
      UpdateAccountParams params) async {
    return await _accountRepository.updateAccount(
        accountEntity: params.accountEntity);
  }
}

class UpdateAccountParams {
  final AccountEntity accountEntity;
  UpdateAccountParams({required this.accountEntity});
}
