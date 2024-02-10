import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';

/// ErrorMixin
mixin ErrorMixin {
  /// Show error
  Future<void> showError(String error, BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(StringConstants.error),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                AppSettings.openAppSettings(
                  type: AppSettingsType.location,
                );
              },
              child: const Text(StringConstants.openSettings),
            ),
            TextButton(
              onPressed: () {
                context.router.pop();
              },
              child: const Text(StringConstants.ok),
            ),
          ],
        );
      },
    );
  }
}
