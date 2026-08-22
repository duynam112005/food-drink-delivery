import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/dio_client.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository_provider.g.dart';

// @riverpod
// class AuthRepositoryProvider extends _$AuthRepositoryProvider{
//   late final AuthRepository _authRepository;

//   @override
//   AuthRepository build() {
//     _authRepository = AuthRepository(apiClient: ApiClient(dio: DioClient().dio));
//     return _authRepository;
//   }
// }

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(apiClient: ApiClient(dio: DioClient().dio));
}