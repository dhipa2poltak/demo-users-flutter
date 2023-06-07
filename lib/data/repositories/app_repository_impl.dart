

import 'package:dartz/dartz.dart';
import 'package:demo_users/data/data_sources/app_data_source.dart';
import 'package:demo_users/data/data_sources/prefs_data_source.dart';
import 'package:demo_users/data/models/user_body.dart';
import 'package:demo_users/domain/entities/app_error.dart';
import 'package:demo_users/domain/entities/user_body_entity.dart';
import 'package:demo_users/domain/entities/user_entity.dart';
import 'package:demo_users/domain/repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRepositoryImpl extends AppRepository {

  AppRepositoryImpl({required this.appDataSource, required this.prefsDataSource});

  AppDataSource appDataSource;
  PrefsDataSource prefsDataSource;

  @override
  Future<Either<AppError, UserBodyEntity?>> createUser(UserBodyEntity entity) async {
    try {
      final response = await appDataSource.createUser(UserBody.fromDomain(entity));

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> deleteUser(int userId) async {
    try {
      final retval = await appDataSource.deleteUser(userId);

      return Right(retval);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, UserEntity?>> getUser(int userId) async {
    try {
      final response = await appDataSource.getUser(userId);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<UserEntity>?>> getUserList(int page) async {
    try {
      final response = await appDataSource.getUserList(page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> hasShowedOnBoarding() async {
    return Right(prefsDataSource.hasShowedOnBoarding());
  }

  @override
  Future<Either<AppError, bool>> setHasShowedOnBoarding(bool hasShowedOnBoarding) async {
    return Right(prefsDataSource.setHasShowedOnBoarding(hasShowedOnBoarding));
  }

  @override
  Future<Either<AppError, UserBodyEntity?>> updateUser(int userId, UserBodyEntity entity) async {
    try {
      final response = await appDataSource.updateUser(userId, UserBody.fromDomain(entity));

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}
