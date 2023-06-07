

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class SetHasShowedOnBoardingUseCase {

  Future<Either<AppError, bool>> call(bool hasShowedOnBoarding);
}
