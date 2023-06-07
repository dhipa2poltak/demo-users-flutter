

import 'package:dartz/dartz.dart';
import 'package:demo_users/domain/entities/user_body_entity.dart';
import 'package:demo_users/domain/entities/user_entity.dart';

import '../entities/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, bool>> hasShowedOnBoarding();
  Future<Either<AppError, bool>> setHasShowedOnBoarding(bool hasShowedOnBoarding);
  Future<Either<AppError, List<UserEntity>?>> getUserList(int page);
  Future<Either<AppError, UserEntity?>> getUser(int userId);
  Future<Either<AppError, UserBodyEntity?>> createUser(UserBodyEntity entity);
  Future<Either<AppError, UserBodyEntity?>> updateUser(int userId, UserBodyEntity entity);
  Future<Either<AppError, bool>> deleteUser(int userId);
}
