
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/user_body_entity.dart';

abstract class UpdateUserUseCase {

  Future<Either<AppError, UserBodyEntity?>> call(int userId, String name, String job);
}
