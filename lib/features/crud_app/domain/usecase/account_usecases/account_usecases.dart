import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/core/usecase/usecase.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'add_account_usecase.dart';
part 'get_accounts_usecase.dart';
part 'remove_account_usecase.dart';
part 'update_account_usecase.dart';

@immutable
@injectable

///Base usecase for reaching Account Usecases
///includes all of AccountUsecases
///You can call only this: `AccountUseCases`
///than use `accountUseCases.addAccountUseCase` for example
class AccountUseCases {
  const AccountUseCases({
    required this.addAccountUseCase,
    required this.getAccountsUseCase,
    required this.removeAccountUseCase,
    required this.updateAccountUseCase,
  });

  final AddAccountUseCase addAccountUseCase;
  final GetAccountsUseCase getAccountsUseCase;

  final RemoveAccountUseCase removeAccountUseCase;
  final UpdateAccountUseCase updateAccountUseCase;
}
