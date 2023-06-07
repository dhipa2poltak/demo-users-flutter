
import 'package:auto_route/auto_route.dart';
import 'package:demo_users/domain/usecases/get_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dz;

import '../../common/function/common_functions.dart';
import '../../common/widget/common_widget.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/update_user_usecase.dart';
import '../../framework/locator/inject_container.dart';

@RoutePage()
class UpdatePage extends StatefulWidget {

  final int userId;

  const UpdatePage({super.key, required this.userId});

  @override
  State<UpdatePage> createState() => _UpdateState();
}

class _UpdateState extends State<UpdatePage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  late FocusNode myFocusNode;

  bool isUpdating = false;
  bool isProgressing = false;

  dz.Either<AppError, UserEntity?>? theEither;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Update User ${widget.userId}"),
      ),
      body: isUpdating ? _buildBodyUpdating(context, theEither) : _buildBody(context),
    );
  }

  Widget _buildBodyUpdating(BuildContext context, dz.Either<AppError, UserEntity?>? either) {
    return Stack(
      children: [
        _buildForm(context, theEither),
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
          return _buildForm(context, either);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildForm(BuildContext context, dz.Either<AppError, UserEntity?>? either) {
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
      _nameController.text = name;

      return buildUserForm(context, _formKey, myFocusNode, _nameController, _jobController, () {
        setState(() {
          isUpdating = true;
          isProgressing = true;

          final name = _nameController.value.text;
          final job = _jobController.value.text;

          final updateUserUseCase = locator<UpdateUserUseCase>();
          updateUserUseCase.call(widget.userId, name, job).then((either) {
            setState(() {
              isProgressing = false;

              either.fold((appError) {
                showAlertDialog(this.context, "Error", appError.message, () {

                });
              }, (entity) {
                showAlertDialog(this.context, "Success", "User updated", () {
                  context.router.back();
                });
              });
            });
          });
        });
      });
    }

    return Text(errorMessage);
  }
}
