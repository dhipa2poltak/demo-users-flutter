

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/user_entity.dart';

abstract class GetUserUseCase {

  Future<Either<AppError, UserEntity?>> call(int userId);
}
