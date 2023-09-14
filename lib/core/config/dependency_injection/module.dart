import 'package:api_crud_app/features/crud_app/data/datasource/remote/account_remote_datasource.dart';
import 'package:api_crud_app/features/crud_app/data/service/api/dio_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  final AccountRemoteDataSource accountDioClient =
      AccountRemoteDataSource(AccountDioClient.dio);
}
