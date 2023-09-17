import 'package:api_crud_app/features/crud_app/domain/repository/account_repository.dart';
import 'package:mockito/annotations.dart';

// we need this for generating mocks
// After null safety we should use GenerateMocks for Mockito
// This generated Mock repository is a common repo so we can use it fot RemoveShortlinkUsecase too. (without generating)
@GenerateMocks([
  AccountRepository
], customMocks: [
  MockSpec<AccountRepository>(
      as: #FakeRepo, onMissingStub: OnMissingStub.throwException),
])
void main() {}
