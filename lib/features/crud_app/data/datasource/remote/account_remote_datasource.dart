import 'package:api_crud_app/features/crud_app/data/constants/data_constants.dart';
import 'package:api_crud_app/features/crud_app/data/model/account_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'account_remote_datasource.g.dart';

@RestApi()
abstract class AccountRemoteDataSource {
  factory AccountRemoteDataSource(Dio dio, {String baseUrl}) =
      _AccountRemoteDataSource;

  @POST(DataConstants.accountEndpoint)
  Future<AccountModel> addAccount({
    @Body() required Map<String, dynamic> body,
  });

  @GET(DataConstants.accountEndpoint)
  Future<List<AccountModel>> getAccounts({
    @Query('page') required int page,
    @Query('limit') int limitForPerPage = DataConstants.paginationLimit,
  });

  @PUT('${DataConstants.accountEndpoint}/{id}')
  Future<AccountModel> updateAnAccount({
    @Path('id') required String id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('${DataConstants.accountEndpoint}/{id}')
  Future<AccountModel> removeAnAccount({@Path('id') required String id});
}
