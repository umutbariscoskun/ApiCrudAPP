import 'dart:io';

import 'package:api_crud_app/features/crud_app/data/model/account_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'account_remote_datasource.g.dart';

@RestApi()
abstract class AccountRemoteDataSource {
  factory AccountRemoteDataSource(Dio dio, {String baseUrl}) =
      _AccountRemoteDataSource;

  @POST('/api/v1/account')
  Future<AccountModel> sendMessageGPT(
    @Header(HttpHeaders.authorizationHeader) String header, {
    @Body() required String body,
  });
}
