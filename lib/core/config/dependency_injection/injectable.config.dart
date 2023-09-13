// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_crud_app/features/crud_app/data/repository/account_repository_impl.dart'
    as _i4;
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart'
    as _i3;
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AccountRepository>(() => _i4.AccountRepositoryImpl());
    gh.factory<_i5.AddAccountUseCase>(
        () => _i5.AddAccountUseCase(gh<_i3.AccountRepository>()));
    gh.factory<_i5.GetAccountsUseCase>(
        () => _i5.GetAccountsUseCase(gh<_i3.AccountRepository>()));
    gh.factory<_i5.RemoveAccountUseCase>(
        () => _i5.RemoveAccountUseCase(gh<_i3.AccountRepository>()));
    gh.factory<_i5.UpdateAccountUseCase>(
        () => _i5.UpdateAccountUseCase(gh<_i3.AccountRepository>()));
    gh.factory<_i5.AccountUseCases>(() => _i5.AccountUseCases(
          addAccountUseCase: gh<_i5.AddAccountUseCase>(),
          getAccountsUseCase: gh<_i5.GetAccountsUseCase>(),
          removeAccountUseCase: gh<_i5.RemoveAccountUseCase>(),
          updateAccountUseCase: gh<_i5.UpdateAccountUseCase>(),
        ));
    return this;
  }
}
