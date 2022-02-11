import 'package:flutter/cupertino.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(message!),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          child: const Text('閉じる'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
