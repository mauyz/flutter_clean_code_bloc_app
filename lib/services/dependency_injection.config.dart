// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cross_platform_app/data/repositories/user_repository_impl.dart'
    as _i10;
import 'package:cross_platform_app/data/sources/local/local_user_source.dart'
    as _i7;
import 'package:cross_platform_app/data/sources/local/preference_storage.dart'
    as _i21;
import 'package:cross_platform_app/data/sources/local/secure_storage.dart'
    as _i20;
import 'package:cross_platform_app/data/sources/local/token_manager.dart'
    as _i5;
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart'
    as _i6;
import 'package:cross_platform_app/data/sources/remote/remote_user_source.dart'
    as _i8;
import 'package:cross_platform_app/domain/repositories/user_repository.dart'
    as _i9;
import 'package:cross_platform_app/domain/usecases/user/get_logged_user.dart'
    as _i11;
import 'package:cross_platform_app/domain/usecases/user/get_user_by_id.dart'
    as _i12;
import 'package:cross_platform_app/domain/usecases/user/log_out_usecase.dart'
    as _i13;
import 'package:cross_platform_app/domain/usecases/user/login_usecase.dart'
    as _i14;
import 'package:cross_platform_app/domain/usecases/user/register_usecase.dart'
    as _i15;
import 'package:cross_platform_app/presentation/dashboard/bloc/get_user_bloc.dart'
    as _i18;
import 'package:cross_platform_app/presentation/onboarding/login/bloc/auth_bloc.dart'
    as _i17;
import 'package:cross_platform_app/presentation/onboarding/register/bloc/register_bloc.dart'
    as _i19;
import 'package:cross_platform_app/presentation/onboarding/splash/bloc/splash_bloc.dart'
    as _i16;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final secureStorage = _$SecureStorage();
    final preferenceStorage = _$PreferenceStorage();
    gh.factory<_i3.FlutterSecureStorage>(() => secureStorage.storage);
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => preferenceStorage.preferences,
      preResolve: true,
    );
    gh.lazySingleton<_i5.TokenManager>(
        () => _i5.TokenManager(secureStorage: gh<_i3.FlutterSecureStorage>()));
    gh.lazySingleton<_i6.ApiClient>(
        () => _i6.ApiClient(tokenManager: gh<_i5.TokenManager>()));
    gh.lazySingleton<_i7.LocaleUserSource>(
        () => _i7.LocaleUserSource(preferences: gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i8.RemoteUserSource>(
        () => _i8.RemoteUserSourceImpl(apiClient: gh<_i6.ApiClient>()));
    gh.lazySingleton<_i9.UserRepository>(() => _i10.UserRepositoryImpl(
          remoteUserSource: gh<_i8.RemoteUserSource>(),
          localeUserSource: gh<_i7.LocaleUserSource>(),
        ));
    gh.lazySingleton<_i11.GetLoggedUser>(
        () => _i11.GetLoggedUser(userRepository: gh<_i9.UserRepository>()));
    gh.lazySingleton<_i12.GettUserById>(
        () => _i12.GettUserById(userRepository: gh<_i9.UserRepository>()));
    gh.lazySingleton<_i13.LogOutUseCase>(
        () => _i13.LogOutUseCase(userRepository: gh<_i9.UserRepository>()));
    gh.lazySingleton<_i14.LoginUseCase>(
        () => _i14.LoginUseCase(userRepository: gh<_i9.UserRepository>()));
    gh.lazySingleton<_i15.RegisterUseCase>(
        () => _i15.RegisterUseCase(userRepository: gh<_i9.UserRepository>()));
    gh.factory<_i16.SplashBloc>(
        () => _i16.SplashBloc(getLoggedUser: gh<_i11.GetLoggedUser>()));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          loginUseCase: gh<_i14.LoginUseCase>(),
          logOutUseCase: gh<_i13.LogOutUseCase>(),
        ));
    gh.factory<_i18.GetUserBloc>(
        () => _i18.GetUserBloc(gettUserById: gh<_i12.GettUserById>()));
    gh.factory<_i19.RegisterBloc>(
        () => _i19.RegisterBloc(registerUseCase: gh<_i15.RegisterUseCase>()));
    return this;
  }
}

class _$SecureStorage extends _i20.SecureStorage {}

class _$PreferenceStorage extends _i21.PreferenceStorage {}
