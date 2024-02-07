import 'package:flutter/material.dart';
import 'package:text_recognitions/product/model/result.dart';

/// Text card dialog
mixin TextCardDialog {
  /// Text card dialog
  Future<bool?> textCardDialog(BuildContext context, Result result) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
