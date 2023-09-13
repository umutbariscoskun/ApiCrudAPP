part of 'account_usecases.dart';

@immutable
@injectable

///Adds an account to API and app flow
class AddAccountUseCase extends UseCase<void, AddAccountParams> {
  final AccountRepository _accountRepository;

  AddAccountUseCase(this._accountRepository);
  @override
  Future<Either<Failure, void>> call(AddAccountParams params) async {
    return await _accountRepository.addAccount(
      accountEntity: params.accountEntity,
    );
  }
}

class AddAccountParams {
  final AccountEntity accountEntity;

  AddAccountParams({
    required this.accountEntity,
  });
}
