import 'package:flutter/material.dart';

class CustomDialogs {
  static Future<void> showDialogAlert(
    BuildContext context,
    String title,
    String message,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Salir'),
          )
        ],
      ),
    );
  }
}
