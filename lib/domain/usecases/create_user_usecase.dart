
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/user_body_entity.dart';

abstract class CreateUserUseCase {

  Future<Either<AppError, UserBodyEntity?>> call(String name, String job);
}
