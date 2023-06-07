
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void enterFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

void exitFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
}

void showAlertDialog(BuildContext context, String title, String message, Function okCallback) {
  Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        okCallback();
      },
      child: const Text('OK')
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton
    ],
  );

  showDialog(
      context: context,
      builder: (context) {
        return alert;
      }
  );
}
