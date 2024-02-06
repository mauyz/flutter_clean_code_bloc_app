// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cross_platform_app/data/repositories/user_repository_impl.dart'
    as _i12;
import 'package:cross_platform_app/data/sources/local/local_user_source.dart'
    as _i9;
import 'package:cross_platform_app/data/sources/local/preference_storage.dart'
    as _i25;
import 'package:cross_platform_app/data/sources/local/secure_storage.dart'
    as _i24;
import 'package:cross_platform_app/data/sources/local/token_manager.dart'
    as _i7;
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart'
    as _i8;
import 'package:cross_platform_app/data/sources/remote/remote_user_source.dart'
    as _i10;
import 'package:cross_platform_app/domain/repositories/user_repository.dart'
    as _i11;
import 'package:cross_platform_app/domain/usecases/user/get_logged_user.dart'
    as _i13;
import 'package:cross_platform_app/domain/usecases/user/get_user_by_id.dart'
    as _i15;
import 'package:cross_platform_app/domain/usecases/user/get_user_list_usecase.dart'
    as _i14;
import 'package:cross_platform_app/domain/usecases/user/log_out_usecase.dart'
    as _i16;
import 'package:cross_platform_app/domain/usecases/user/login_usecase.dart'
    as _i17;
import 'package:cross_platform_app/domain/usecases/user/register_usecase.dart'
    as _i18;
import 'package:cross_platform_app/presentation/dashboard/home/bloc/navigation_home_cubit.dart'
    as _i4;
import 'package:cross_platform_app/presentation/dashboard/profile/bloc/get_user_bloc.dart'
    as _i21;
import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart'
    as _i22;
import 'package:cross_platform_app/presentation/dashboard/users/bloc/pagination_cubit.dart'
    as _i5;
import 'package:cross_platform_app/presentation/onboarding/login/bloc/auth_bloc.dart'
    as _i20;
import 'package:cross_platform_app/presentation/onboarding/register/bloc/register_bloc.dart'
    as _i23;
import 'package:cross_platform_app/presentation/onboarding/splash/bloc/splash_bloc.dart'
    as _i19;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    gh.factory<_i4.NavigationHomeCubit>(() => _i4.NavigationHomeCubit());
    gh.factory<_i5.PaginationCubit>(() => _i5.PaginationCubit());
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => preferenceStorage.preferences,
      preResolve: true,
    );
    gh.lazySingleton<_i7.TokenManager>(
        () => _i7.TokenManager(secureStorage: gh<_i3.FlutterSecureStorage>()));
    gh.lazySingleton<_i8.ApiClient>(
        () => _i8.ApiClient(tokenManager: gh<_i7.TokenManager>()));
    gh.lazySingleton<_i9.LocaleUserSource>(
        () => _i9.LocaleUserSource(preferences: gh<_i6.SharedPreferences>()));
    gh.lazySingleton<_i10.RemoteUserSource>(
        () => _i10.RemoteUserSourceImpl(apiClient: gh<_i8.ApiClient>()));
    gh.lazySingleton<_i11.UserRepository>(() => _i12.UserRepositoryImpl(
          remoteUserSource: gh<_i10.RemoteUserSource>(),
          localeUserSource: gh<_i9.LocaleUserSource>(),
        ));
    gh.lazySingleton<_i13.GetLoggedUser>(
        () => _i13.GetLoggedUser(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i14.GetUserListUseCase>(() =>
        _i14.GetUserListUseCase(userRepository: gh<_i11.UserRepository>()));
    gh.lazySingleton<_i15.GettUserById>(
        () => _i15.GettUserById(userRepository: gh<_i11.UserRepository>()));
    gh.lazySingleton<_i16.LogOutUseCase>(
        () => _i16.LogOutUseCase(userRepository: gh<_i11.UserRepository>()));
    gh.lazySingleton<_i17.LoginUseCase>(
        () => _i17.LoginUseCase(userRepository: gh<_i11.UserRepository>()));
    gh.lazySingleton<_i18.RegisterUseCase>(
        () => _i18.RegisterUseCase(userRepository: gh<_i11.UserRepository>()));
    gh.factory<_i19.SplashBloc>(
        () => _i19.SplashBloc(getLoggedUser: gh<_i13.GetLoggedUser>()));
    gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
          loginUseCase: gh<_i17.LoginUseCase>(),
          logOutUseCase: gh<_i16.LogOutUseCase>(),
        ));
    gh.factory<_i21.GetUserBloc>(
        () => _i21.GetUserBloc(gettUserById: gh<_i15.GettUserById>()));
    gh.factory<_i22.GetUserListBloc>(() => _i22.GetUserListBloc(
        getUserListUseCase: gh<_i14.GetUserListUseCase>()));
    gh.factory<_i23.RegisterBloc>(
        () => _i23.RegisterBloc(registerUseCase: gh<_i18.RegisterUseCase>()));
    return this;
  }
}

class _$SecureStorage extends _i24.SecureStorage {}

class _$PreferenceStorage extends _i25.PreferenceStorage {}
