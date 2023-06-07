
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/user_entity.dart';

abstract class GetUserListUseCase {

  Future<Either<AppError, List<UserEntity>?>> call(int page);
}
