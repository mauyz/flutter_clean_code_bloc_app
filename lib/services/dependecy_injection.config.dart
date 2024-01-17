// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cross_platform_app/data/repositories/user_repository_impl.dart'
    as _i7;
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart'
    as _i4;
import 'package:cross_platform_app/data/sources/remote/api/token_manager.dart'
    as _i3;
import 'package:cross_platform_app/data/sources/remote/remote_user_source.dart'
    as _i5;
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart'
    as _i6;
import 'package:cross_platform_app/domain/usecases/user/login.dart' as _i8;
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
    gh.lazySingleton<_i3.TokenManager>(() => _i3.TokenManager());
    gh.lazySingleton<_i4.ApiClient>(
        () => _i4.ApiClient(tokenManager: gh<_i3.TokenManager>()));
    gh.lazySingleton<_i5.RemoteUserSource>(
        () => _i5.RemoteUserSourceImpl(apiClient: gh<_i4.ApiClient>()));
    gh.lazySingleton<_i6.UserRepository>(() =>
        _i7.UserRepositoryImpl(remoteUserSource: gh<_i5.RemoteUserSource>()));
    gh.lazySingleton<_i8.Login>(
        () => _i8.Login(userRepository: gh<_i6.UserRepository>()));
    return this;
  }
}
