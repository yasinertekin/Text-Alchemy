import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/model/result.dart';

/// Text card dialog
mixin TextCardDialog {
  /// Text card dialog
  Future<bool?> textCardDialog(BuildContext context, Result result) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(StringConstants.deleteConfirmation),
          content:
              const Text(StringConstants.areYouSureYouWantToDeleteThisItem),
          actions: <TextButton>[
            TextButton(
              onPressed: () => context.router.pop(true),
              child: const Text(StringConstants.delete),
            ),
            TextButton(
              onPressed: () => context.router.pop(false),
              child: const Text(StringConstants.cancel),
            ),
          ],
        );
      },
    );
  }
}
