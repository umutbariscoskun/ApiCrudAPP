part of 'account_usecases.dart';

@immutable
@injectable

///Get Accounts
class GetAccountsUseCase extends StreamUseCase<List<AccountEntity>, void> {
  final AccountRepository _accountRepository;
  GetAccountsUseCase(this._accountRepository);

  @override
  Stream<Either<Failure, List<AccountEntity>>> call(void params) {
    return _accountRepository.getAccounts(noParams: NoParams());
  }
}
