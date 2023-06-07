

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dz;

import '../../common/function/common_functions.dart';
import '../../common/widget/common_widget.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/delete_user_usecase.dart';
import '../../domain/usecases/get_user_usecase.dart';
import '../../framework/locator/inject_container.dart';

@RoutePage()
class DeletePage extends StatefulWidget {

  final int userId;

  const DeletePage({super.key, required this.userId});

  @override
  State<DeletePage> createState() => _DeleteState();
}

class _DeleteState extends State<DeletePage> {

  bool isDeleting = false;
  bool isProgressing = false;

  dz.Either<AppError, UserEntity?>? theEither;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Delete User ${widget.userId}"),
      ),
      body: isDeleting ? _buildBodyDeleting(context, theEither) : _buildBody(context),
    );
  }

  Widget _buildBodyDeleting(BuildContext context, dz.Either<AppError, UserEntity?>? either) {
    return Stack(
      children: [
        _buildUserView(context, theEither),
        isProgressing ? const Center(
          child: CircularProgressIndicator(),
        ) : emptyWidget()
      ],
    );
  }

  FutureBuilder<dz.Either<AppError, UserEntity?>> _buildBody(BuildContext context) {
    final getUserUseCase = locator<GetUserUseCase>();

    return FutureBuilder<dz.Either<AppError, UserEntity?>>(
      future: getUserUseCase(widget.userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final dz.Either<AppError, UserEntity?>? either = snapshot.data;

          theEither = either;
          return _buildUserView(context, either);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildUserView(BuildContext context, dz.Either<AppError, UserEntity?>? either) {
    UserEntity? userEntity;
    String errorMessage = "error fetching data";

    if (either != null) {
      either.fold((appError) {
        errorMessage = appError.message;
      }, (entity) {
        userEntity = entity;
      });
    }

    if (userEntity != null) {
      final name = "${userEntity!.firstName} ${userEntity!.lastName}";

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              width: double.infinity,
              child: Text("Name: $name"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              width: double.infinity,
              child: const Text("Job: -"),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                width: double.infinity,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _doDeleteUser(this.context, widget.userId);
                    },
                    child: const Text('Delete'),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Text(errorMessage);
  }

  void _doDeleteUser(BuildContext context, int userId) {
    final deleteUserUseCase = locator<DeleteUserUseCase>();
    deleteUserUseCase.call(userId).then((either) {
      setState(() {
        isProgressing = false;

        either.fold((appError) {
          showAlertDialog(context, "Error", appError.message, () {

          });
        }, (entity) {
          showAlertDialog(context, "Success", "User Deleted", () {
            context.router.back();
          });
        });
      });
    });
  }
}
