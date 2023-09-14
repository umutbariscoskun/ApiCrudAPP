import 'package:api_crud_app/core/errors/failures.dart';
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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

  final AccountUseCases _accountUseCases;

  Future<void> init() async {
    final result = await foldAsync(() async => await _accountUseCases
        .getAccountsUseCase
        .call(GetAccountParams(page: 1)));
  }

  Future<void> addAccount() async {}

  Future<T?> foldAsync<T>(
    Future<Either<Failure, T>> Function() result,
  ) async {
    final response = await result();

    return response.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
