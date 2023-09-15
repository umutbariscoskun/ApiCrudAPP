import 'package:api_crud_app/core/enum/account_text_field_type.dart';
import 'package:api_crud_app/core/extension/cubit_extension.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:api_crud_app/features/crud_app/presentation/widgets/item/account_fields_page_model.dart';
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
  late final accountFieldsPageModelList = <AccountFieldsPageModel>[];

  Future<void> init() async {}

  void emitTextFieldStates(
      {required AccountTextFieldType accountTextFieldType,
      required String value}) {
    switch (accountTextFieldType) {
      case AccountTextFieldType.name:
        emit(state.copyWith(name: value));
      case AccountTextFieldType.surname:
        emit(state.copyWith(surname: value));
      case AccountTextFieldType.birthDate:
        emit(state.copyWith(birthDate: DateTime.parse(value)));
      case AccountTextFieldType.identityNumber:
        emit(state.copyWith(identityNumber: value));
      case AccountTextFieldType.phoneNumber:
        emit(state.copyWith(phoneNumber: value));
      case AccountTextFieldType.salary:
        emit(state.copyWith(salary: value));
    }
  }

  Future<void> addAccount() async {
    final entity = AccountEntity(
        name: state.name,
        surname: state.surname,
        birthDate: state.birthDate ?? DateTime(2004),
        salary: int.parse(state.salary),
        phoneNumber: state.phoneNumber,
        identityNumber: state.identityNumber,
        id: '');
    await foldAsync(
      () async => _accountUseCases.addAccountUseCase.call(
        AddAccountParams(
          accountEntity: entity,
        ),
      ),
    );
  }

  Future<void> updateAccount({
    required AccountEntity accountEntity,
  }) async {
    final entity = AccountEntity(
      name: state.name,
      surname: state.surname,
      birthDate: state.birthDate ?? DateTime(2004),
      salary: int.parse(state.salary),
      phoneNumber: state.phoneNumber,
      identityNumber: state.identityNumber,
      id: accountEntity.id,
    );
    await foldAsync(
      () async =>
          _accountUseCases.updateAccountUseCase.call(UpdateAccountParams(
        accountEntity: entity,
      )),
    );
  }
}
