import 'dart:io';

import 'package:api_crud_app/features/crud_app/data/constants/data_constants.dart';
import 'package:dio/dio.dart';

mixin AccountDioClient {
  static final Dio dio = _init();
  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: DataConstants.baseUrl,
    headers: {HttpHeaders.acceptHeader: 'application/json'},
  );
  static Dio _init() {
    final dio = Dio(_baseOptions);
    return dio;
  }
}
