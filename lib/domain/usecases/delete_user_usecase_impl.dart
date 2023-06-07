

import 'package:dartz/dartz.dart';
import 'package:demo_users/domain/entities/app_error.dart';
import 'package:demo_users/domain/repositories/app_repository.dart';
import 'package:demo_users/domain/usecases/delete_user_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeleteUserUseCaseImpl extends DeleteUserUseCase {

  DeleteUserUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, bool>> call(int userId) {
    return appRepository.deleteUser(userId);
  }
}
