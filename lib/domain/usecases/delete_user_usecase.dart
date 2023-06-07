
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class DeleteUserUseCase {

  Future<Either<AppError, bool>> call(int userId);
}
