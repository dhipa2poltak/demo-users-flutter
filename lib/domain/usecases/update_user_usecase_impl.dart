
import 'package:dartz/dartz.dart';
import 'package:demo_users/domain/entities/app_error.dart';
import 'package:demo_users/domain/entities/user_body_entity.dart';
import 'package:demo_users/domain/repositories/app_repository.dart';
import 'package:demo_users/domain/usecases/update_user_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateUserUseCaseImpl extends UpdateUserUseCase {

  UpdateUserUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, UserBodyEntity?>> call(int userId, String name, String job) {
    return appRepository.updateUser(userId, UserBodyEntity(name: name, job: job));
  }
}
