part of 'account_usecases.dart';

@immutable
@injectable

///Get Accounts
class GetAccountsUseCase
    extends UseCase<List<AccountEntity>, GetAccountParams> {
  final AccountRepository _accountRepository;
  GetAccountsUseCase(this._accountRepository);

  @override
  Future<Either<Failure, List<AccountEntity>>> call(GetAccountParams params) {
    return _accountRepository.getAccounts(page: params.page);
  }
}

class GetAccountParams {
  final int page;
  GetAccountParams({required this.page});
}
