

import 'package:dartz/dartz.dart';
import 'package:demo_users/domain/entities/app_error.dart';
import 'package:demo_users/domain/entities/user_body_entity.dart';
import 'package:demo_users/domain/usecases/create_user_usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/app_repository.dart';

@Injectable()
class CreateUserUseCaseImpl extends CreateUserUseCase {

  CreateUserUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, UserBodyEntity?>> call(String name, String job) {
    return appRepository.createUser(UserBodyEntity(name: name, job: job));
  }
}
