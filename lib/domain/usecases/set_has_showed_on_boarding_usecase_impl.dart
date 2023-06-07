

import 'package:dartz/dartz.dart';
import 'package:demo_users/domain/entities/app_error.dart';
import 'package:demo_users/domain/repositories/app_repository.dart';
import 'package:demo_users/domain/usecases/set_has_showed_on_boarding_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetHasShowedOnBoardingUseCaseImpl extends SetHasShowedOnBoardingUseCase {

  SetHasShowedOnBoardingUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, bool>> call(bool hasShowedOnBoarding) {
    return appRepository.setHasShowedOnBoarding(hasShowedOnBoarding);
  }
}
