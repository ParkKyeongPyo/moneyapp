import 'package:flutter/material.dart';
import 'package:moneyapp/main.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  //알림창 함수
  static void showDialogAlert({
    required BuildContext context,
    required title,
    required message,
  }) {
    // Create an AlertDialog object.
    AlertDialog dialog = AlertDialog(
      title: Text('$title'),
      content: Text('$message'),
      actions: [
        // Create a button that closes the dialog.
        TextButton(
          child: const Text('확인'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    // Show the dialog.
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  static void showDialogTwoOptionAlert({
    required BuildContext context,
    required title,
    required message,
  }) {
    // Create an AlertDialog object.
    AlertDialog dialog = AlertDialog(
      title: Text('$title'),
      content: Text('$message'),
      actions: [
        // Create a button that closes the dialog.
        TextButton(
          child: const Text('확인'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          ),
        ),
        TextButton(
          child: const Text('취소'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    // Show the dialog.
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
