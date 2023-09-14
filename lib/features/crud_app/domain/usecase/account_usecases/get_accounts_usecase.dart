part of 'account_usecases.dart';

@immutable
@injectable

///Get Accounts
class GetAccountsUseCase extends UseCase<List<AccountEntity>, void> {
  final AccountRepository _accountRepository;
  GetAccountsUseCase(this._accountRepository);

  @override
  Future<Either<Failure, List<AccountEntity>>> call(void params) {
    return _accountRepository.getAccounts(noParams: NoParams());
  }
}
