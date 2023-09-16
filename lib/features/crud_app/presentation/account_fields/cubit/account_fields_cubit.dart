import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'account_fields_state.dart';

@injectable
class AccountFieldsCubit extends Cubit<AccountFieldsState> {
  AccountFieldsCubit({
    required AccountUseCases accountUseCases,
  })  : _accountUseCases = accountUseCases,
        super(const AccountFieldsState()) {
    init();
  }

  final AccountUseCases _accountUseCases;

  Future<void> init() async {}
}
