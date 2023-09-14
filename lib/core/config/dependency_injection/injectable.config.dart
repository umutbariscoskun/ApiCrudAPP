// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_crud_app/core/config/dependency_injection/module.dart'
    as _i7;
import 'package:api_crud_app/features/crud_app/data/datasource/remote/account_remote_datasource.dart'
    as _i3;
import 'package:api_crud_app/features/crud_app/data/repository/account_repository_impl.dart'
    as _i5;
import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart'
    as _i4;
import 'package:api_crud_app/features/crud_app/domain/usecase/account_usecases/account_usecases.dart'
    as _i6;
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
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AccountRemoteDataSource>(
        () => registerModule.accountDioClient);
    gh.factory<_i4.AccountRepository>(
        () => _i5.AccountRepositoryImpl(gh<_i3.AccountRemoteDataSource>()));
    gh.factory<_i6.AddAccountUseCase>(
        () => _i6.AddAccountUseCase(gh<_i4.AccountRepository>()));
    gh.factory<_i6.GetAccountsUseCase>(
        () => _i6.GetAccountsUseCase(gh<_i4.AccountRepository>()));
    gh.factory<_i6.RemoveAccountUseCase>(
        () => _i6.RemoveAccountUseCase(gh<_i4.AccountRepository>()));
    gh.factory<_i6.UpdateAccountUseCase>(
        () => _i6.UpdateAccountUseCase(gh<_i4.AccountRepository>()));
    gh.factory<_i6.AccountUseCases>(() => _i6.AccountUseCases(
          addAccountUseCase: gh<_i6.AddAccountUseCase>(),
          getAccountsUseCase: gh<_i6.GetAccountsUseCase>(),
          removeAccountUseCase: gh<_i6.RemoveAccountUseCase>(),
          updateAccountUseCase: gh<_i6.UpdateAccountUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
