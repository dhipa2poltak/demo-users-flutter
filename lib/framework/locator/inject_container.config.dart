// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo_users/data/data_sources/app_data_source.dart' as _i8;
import 'package:demo_users/data/data_sources/prefs_data_source.dart' as _i11;
import 'package:demo_users/data/repositories/app_repository_impl.dart' as _i12;
import 'package:demo_users/domain/repositories/app_repository.dart' as _i13;
import 'package:demo_users/domain/usecases/create_user_usecase.dart' as _i21;
import 'package:demo_users/domain/usecases/create_user_usecase_impl.dart'
    as _i14;
import 'package:demo_users/domain/usecases/delete_user_usecase.dart' as _i22;
import 'package:demo_users/domain/usecases/delete_user_usecase_impl.dart'
    as _i15;
import 'package:demo_users/domain/usecases/get_user_list_usecase.dart' as _i23;
import 'package:demo_users/domain/usecases/get_user_list_usecase_impl.dart'
    as _i16;
import 'package:demo_users/domain/usecases/get_user_usecase.dart' as _i24;
import 'package:demo_users/domain/usecases/get_user_usecase_impl.dart' as _i17;
import 'package:demo_users/domain/usecases/has_showed_on_boarding_usecase.dart'
    as _i25;
import 'package:demo_users/domain/usecases/has_showed_on_boarding_usecase_impl.dart'
    as _i18;
import 'package:demo_users/domain/usecases/set_has_showed_on_boarding_usecase.dart'
    as _i26;
import 'package:demo_users/domain/usecases/set_has_showed_on_boarding_usecase_impl.dart'
    as _i19;
import 'package:demo_users/domain/usecases/update_user_usecase.dart' as _i27;
import 'package:demo_users/domain/usecases/update_user_usecase_impl.dart'
    as _i20;
import 'package:demo_users/framework/data/core/api_client.dart' as _i3;
import 'package:demo_users/framework/data/data_sources/app_data_source_impl.dart'
    as _i4;
import 'package:demo_users/framework/data/data_sources/prefs_data_source_impl.dart'
    as _i10;
import 'package:demo_users/framework/locator/module/app_module.dart' as _i28;
import 'package:demo_users/framework/router/app_router.dart' as _i5;
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

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
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient.create());
    gh.lazySingleton<_i4.AppDataSourceImpl>(
        () => _i4.AppDataSourceImpl(gh<_i3.ApiClient>()));
    gh.lazySingleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.lazySingleton<_i6.PrettyDioLogger>(() => appModule.logger);
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.AppDataSource>(
        () => appModule.provideAppDataSource(gh<_i4.AppDataSourceImpl>()));
    gh.lazySingleton<_i9.Dio>(
        () => appModule.provideDio(gh<_i6.PrettyDioLogger>()));
    gh.lazySingleton<_i10.PrefsDataSourceImpl>(
        () => _i10.PrefsDataSourceImpl(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i11.PrefsDataSource>(
        () => appModule.providePrefsDataSource(gh<_i10.PrefsDataSourceImpl>()));
    gh.lazySingleton<_i12.AppRepositoryImpl>(() => _i12.AppRepositoryImpl(
          appDataSource: gh<_i8.AppDataSource>(),
          prefsDataSource: gh<_i11.PrefsDataSource>(),
        ));
    gh.lazySingleton<_i13.AppRepository>(
        () => appModule.provideAppRepository(gh<_i12.AppRepositoryImpl>()));
    gh.factory<_i14.CreateUserUseCaseImpl>(
        () => _i14.CreateUserUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i15.DeleteUserUseCaseImpl>(
        () => _i15.DeleteUserUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i16.GetUserListUseCaseImpl>(
        () => _i16.GetUserListUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i17.GetUserUseCaseImpl>(
        () => _i17.GetUserUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i18.HasShowedOnBoardingUseCaseImpl>(
        () => _i18.HasShowedOnBoardingUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i19.SetHasShowedOnBoardingUseCaseImpl>(
        () => _i19.SetHasShowedOnBoardingUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i20.UpdateUserUseCaseImpl>(
        () => _i20.UpdateUserUseCaseImpl(gh<_i13.AppRepository>()));
    gh.factory<_i21.CreateUserUseCase>(() =>
        appModule.provideCreateUserUseCase(gh<_i14.CreateUserUseCaseImpl>()));
    gh.factory<_i22.DeleteUserUseCase>(() =>
        appModule.provideDeleteUserUseCase(gh<_i15.DeleteUserUseCaseImpl>()));
    gh.factory<_i23.GetUserListUseCase>(() =>
        appModule.provideGetUserListUseCase(gh<_i16.GetUserListUseCaseImpl>()));
    gh.factory<_i24.GetUserUseCase>(
        () => appModule.provideGetUserUseCase(gh<_i17.GetUserUseCaseImpl>()));
    gh.factory<_i25.HasShowedOnBoardingUseCase>(() =>
        appModule.provideHasShowedOnBoardingUseCase(
            gh<_i18.HasShowedOnBoardingUseCaseImpl>()));
    gh.factory<_i26.SetHasShowedOnBoardingUseCase>(() =>
        appModule.provideSetHasShowedOnBoardingUseCase(
            gh<_i19.SetHasShowedOnBoardingUseCaseImpl>()));
    gh.factory<_i27.UpdateUserUseCase>(() =>
        appModule.provideUpdateUserUseCase(gh<_i20.UpdateUserUseCaseImpl>()));
    return this;
  }
}

class _$AppModule extends _i28.AppModule {}
