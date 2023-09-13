part of 'account_usecases.dart';

@immutable
@injectable

///Removes an account from API and app flow
class RemoveAccountUseCase extends UseCase<void, RemoveAccountParams> {
  final AccountRepository _accountRepository;

  RemoveAccountUseCase(this._accountRepository);

  @override
  Future<Either<Failure, void>> call(RemoveAccountParams params) async {
    return await _accountRepository.removeAccount(
        accountEntityId: params.accountId);
  }
}

class RemoveAccountParams {
  final String accountId;

  RemoveAccountParams(this.accountId);
}
