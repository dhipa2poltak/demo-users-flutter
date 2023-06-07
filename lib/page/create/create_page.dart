

import 'package:auto_route/auto_route.dart';
import 'package:demo_users/domain/usecases/create_user_usecase.dart';
import 'package:demo_users/framework/locator/inject_container.dart';
import 'package:flutter/material.dart';

import '../../common/function/common_functions.dart';
import '../../common/widget/common_widget.dart';

@RoutePage()
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreateState();
}

class _CreateState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  late FocusNode myFocusNode;

  bool isProgressing = false;

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
      appBar: AppBar(
        title: const Text("Create User"),
      ),
      body: Stack(
        children: <Widget>[
          buildUserForm(context, _formKey, myFocusNode, _nameController, _jobController, () {
            setState(() {
              isProgressing = true;

              final name = _nameController.value.text;
              final job = _jobController.value.text;

              final createUserUseCase = locator<CreateUserUseCase>();
              createUserUseCase.call(name, job).then((either) {
                setState(() {
                  isProgressing = false;

                  either.fold((appError) {
                    showAlertDialog(context, "Error", appError.message, () {

                    });
                  }, (entity) {
                    showAlertDialog(context, "Success", "User created", () {
                      _nameController.clear();
                      _jobController.clear();
                      myFocusNode.requestFocus();
                    });
                  });
                });
              });
            });
          }),
          isProgressing ? const Center(
            child: CircularProgressIndicator(),
          ) : emptyWidget()
        ],
      )
    );
  }
}
