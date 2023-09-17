import 'package:api_crud_app/core/enum/account_text_field_type.dart';
import 'package:api_crud_app/core/extension/cubit_extension.dart';
import 'package:api_crud_app/features/crud_app/domain/entity/account_entity.dart';
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required AccountUseCases accountUseCases,
  })  : _accountUseCases = accountUseCases,
        super(const HomeState()) {
    init();
  }
  int _page = 1;
  bool isLastPage = false;
  final AccountUseCases _accountUseCases;
  var _list = <AccountEntity>[];
  late final ScrollController scrollController;

  Future<void> init() async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !state.scrollIsLoading) {
        if (!isLastPage) {
          _page++;
          emit(state.copyWith(scrollIsLoading: true));
          await getAccounts();
          emit(state.copyWith(scrollIsLoading: false));
        }
      }
    });

    await getAccounts();

    emit(state.copyWith(homeStatus: HomeStatus.success));
  }

  Future<void> getAccounts() async {
    if (!isLastPage) {
      final result = await foldAsync(() async => await _accountUseCases
          .getAccountsUseCase
          .call(GetAccountParams(page: _page)));

      if (result != null) {
        if (result.isEmpty) {
          isLastPage = true;
        } else {
          _list.addAll(result);

          ///to prevent duplicate elements
          ///there might be duplicates because of new added accounts
          final Set list = <AccountEntity>{};
          list.addAll(_list);

          emit(state.copyWith(accountEntityList: [...list]));
        }
      }
    }
  }

  Future<void> removeAccountEntity({required String accountEntityId}) async {
    final result = await _accountUseCases.removeAccountUseCase
        .call(RemoveAccountParams(accountEntityId));
    result.fold((l) => null, (r) {
      _list = state.accountEntityList;
      _list.removeWhere((element) => element.id == accountEntityId);
      emit(state.copyWith(accountEntityList: _list));
    });
  }

  void emitBirthDate(DateTime? value) {
    emit(state.copyWith(birthDate: value));
  }

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
    final result = await foldAsync(
      () async => _accountUseCases.addAccountUseCase.call(
        AddAccountParams(
          accountEntity: entity,
        ),
      ),
    );
    if (result != null) {
      if (state.accountEntityList.isNotEmpty) {
        _list = state.accountEntityList;
        _list.add(result);
        emit(state.copyWith(accountEntityList: _list));
      } else {
        emit(state.copyWith(accountEntityList: [result]));
      }
    }
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
    final result = await foldAsync(
      () async =>
          _accountUseCases.updateAccountUseCase.call(UpdateAccountParams(
        accountEntity: entity,
      )),
    );

    if (result != null) {
      _list = state.accountEntityList;
      final index = _list.indexWhere((element) => element.id == result.id);
      _list.insert(index, result);
      emit(state.copyWith(accountEntityList: _list));
    }
  }
}
