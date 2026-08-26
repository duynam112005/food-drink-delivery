// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:food_drink_delivery/di/register_module.dart' as _i738;
import 'package:food_drink_delivery/network/api_client.dart' as _i228;
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart'
    as _i770;
import 'package:food_drink_delivery/services/auth_service.dart' as _i853;
import 'package:food_drink_delivery/storage/secure_storage.dart' as _i48;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i853.AuthService>(() => _i853.AuthService());
    gh.lazySingleton<_i48.SecureStorage>(() => _i48.SecureStorage());
    gh.lazySingleton<_i228.ApiClient>(() => _i228.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i770.AuthRepository>(
      () => _i770.AuthRepository(apiClient: gh<_i228.ApiClient>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i738.RegisterModule {}
