// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cross_platform_app/data/repositories/user_repository_impl.dart'
    as _i9;
import 'package:cross_platform_app/data/sources/local/local_user_source.dart'
    as _i4;
import 'package:cross_platform_app/data/sources/local/secure_storage.dart'
    as _i13;
import 'package:cross_platform_app/data/sources/local/token_manager.dart'
    as _i5;
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart'
    as _i6;
import 'package:cross_platform_app/data/sources/remote/remote_user_source.dart'
    as _i7;
import 'package:cross_platform_app/domain/repositories/user_repository.dart'
    as _i8;
import 'package:cross_platform_app/domain/usecases/user/get_user_by_id.dart'
    as _i10;
import 'package:cross_platform_app/domain/usecases/user/log_out_usecase.dart'
    as _i11;
import 'package:cross_platform_app/domain/usecases/user/login_usecase.dart'
    as _i12;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
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
    final secureStorage = _$SecureStorage();
    gh.factory<_i3.FlutterSecureStorage>(() => secureStorage.storage);
    gh.lazySingleton<_i4.LocaleUserSource>(() =>
        _i4.LocaleUserSource(secureStorage: gh<_i3.FlutterSecureStorage>()));
    gh.lazySingleton<_i5.TokenManager>(
        () => _i5.TokenManager(secureStorage: gh<_i3.FlutterSecureStorage>()));
    gh.lazySingleton<_i6.ApiClient>(
        () => _i6.ApiClient(tokenManager: gh<_i5.TokenManager>()));
    gh.lazySingleton<_i7.RemoteUserSource>(
        () => _i7.RemoteUserSourceImpl(apiClient: gh<_i6.ApiClient>()));
    gh.lazySingleton<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
          remoteUserSource: gh<_i7.RemoteUserSource>(),
          localeUserSource: gh<_i4.LocaleUserSource>(),
        ));
    gh.lazySingleton<_i10.GettUserById>(
        () => _i10.GettUserById(userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i11.LogOutUseCase>(
        () => _i11.LogOutUseCase(userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i12.LoginUseCase>(
        () => _i12.LoginUseCase(userRepository: gh<_i8.UserRepository>()));
    return this;
  }
}

class _$SecureStorage extends _i13.SecureStorage {}
