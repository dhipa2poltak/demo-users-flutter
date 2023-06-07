
import 'package:flutter/material.dart';

Widget buildUserForm(
    BuildContext context,
    GlobalKey<FormState> formKey,
    FocusNode focusNode,
    TextEditingController nameController,
    TextEditingController jobController,
    Function() submitCallback
    ) {

  return Form(
    key: formKey,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            width: double.infinity,
            child: TextFormField(
              focusNode: focusNode,
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "enter name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            width: double.infinity,
            child: TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "enter job"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the job';
                }
                return null;
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              width: double.infinity,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      submitCallback();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget emptyWidget() {
  return const SizedBox.shrink();
}
