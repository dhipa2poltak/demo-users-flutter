

import 'package:dartz/dartz.dart';
import 'package:demo_users/domain/entities/app_error.dart';
import 'package:demo_users/domain/entities/user_entity.dart';
import 'package:demo_users/domain/repositories/app_repository.dart';
import 'package:demo_users/domain/usecases/get_user_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetUserUseCaseImpl extends GetUserUseCase {

  GetUserUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, UserEntity?>> call(int userId) {
    return appRepository.getUser(userId);
  }
}
