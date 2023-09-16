import 'package:api_crud_app/core/config/dependency_injection/injectable.dart';
import 'package:api_crud_app/core/config/router/router.dart';
import 'package:api_crud_app/features/crud_app/data/constants/locale_key_constants.dart';

final AppRouter appRouter = getIt<AppRouter>();

final LocaleKeyConstants _localeKeyConstants = LocaleKeyConstants();

LocaleKeyConstants get locales => _localeKeyConstants;
