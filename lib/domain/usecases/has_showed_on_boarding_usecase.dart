
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class HasShowedOnBoardingUseCase {

  Future<Either<AppError, bool>> call();
}
