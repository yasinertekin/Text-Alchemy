import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// ErrorMixin
mixin ErrorMixin {
  /// Show error
  Future<void> showError(String error, BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                context.router.pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
