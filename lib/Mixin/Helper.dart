
import 'package:flutter/material.dart';

mixin Helper {
  void showSnackBare(BuildContext context,
      {required String message, required bool visibility}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: visibility ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 3,
      ),
    );
  }
}