
import 'package:demo_users/domain/usecases/has_showed_on_boarding_usecase.dart';
import 'package:demo_users/domain/usecases/set_has_showed_on_boarding_usecase.dart';
import 'package:demo_users/domain/usecases/update_user_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config.dart';
import '../../../data/data_sources/app_data_source.dart';
import '../../../data/data_sources/prefs_data_source.dart';
import '../../../data/repositories/app_repository_impl.dart';
import '../../../domain/repositories/app_repository.dart';
import '../../../domain/usecases/create_user_usecase.dart';
import '../../../domain/usecases/create_user_usecase_impl.dart';
import '../../../domain/usecases/delete_user_usecase.dart';
import '../../../domain/usecases/delete_user_usecase_impl.dart';
import '../../../domain/usecases/get_user_list_usecase.dart';
import '../../../domain/usecases/get_user_list_usecase_impl.dart';
import '../../../domain/usecases/get_user_usecase.dart';
import '../../../domain/usecases/get_user_usecase_impl.dart';
import '../../../domain/usecases/has_showed_on_boarding_usecase_impl.dart';
import '../../../domain/usecases/set_has_showed_on_boarding_usecase_impl.dart';
import '../../../domain/usecases/update_user_usecase_impl.dart';
import '../../data/data_sources/app_data_source_impl.dart';
import '../../data/data_sources/prefs_data_source_impl.dart';

@module
abstract class AppModule {

  @lazySingleton
  PrettyDioLogger get logger => PrettyDioLogger();

  @lazySingleton
  Dio provideDio(PrettyDioLogger loggger) {
    var instance = Dio();

    if (AppConfig.appFlavor == Flavor.Dev) {
      instance.interceptors.add(loggger);
    }

    return instance;
  }

  @lazySingleton
  AppDataSource provideAppDataSource(AppDataSourceImpl appDataSource) {
    return appDataSource;
  }

  @lazySingleton
  PrefsDataSource providePrefsDataSource(PrefsDataSourceImpl prefsDataSource) {
    return prefsDataSource;
  }

  @lazySingleton
  AppRepository provideAppRepository(AppRepositoryImpl appRepository) {
    return appRepository;
  }

  @injectable
  CreateUserUseCase provideCreateUserUseCase(CreateUserUseCaseImpl impl) {
    return impl;
  }

  @injectable
  DeleteUserUseCase provideDeleteUserUseCase(DeleteUserUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetUserListUseCase provideGetUserListUseCase(GetUserListUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetUserUseCase provideGetUserUseCase(GetUserUseCaseImpl impl) {
    return impl;
  }

  @injectable
  HasShowedOnBoardingUseCase provideHasShowedOnBoardingUseCase(HasShowedOnBoardingUseCaseImpl impl) {
    return impl;
  }

  @injectable
  SetHasShowedOnBoardingUseCase provideSetHasShowedOnBoardingUseCase(SetHasShowedOnBoardingUseCaseImpl impl) {
    return impl;
  }

  @injectable
  UpdateUserUseCase provideUpdateUserUseCase(UpdateUserUseCaseImpl impl) {
    return impl;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
