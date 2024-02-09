import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';

/// Copy clipboard mixin
mixin CopyClipBoard {
  /// Copy to clipboard
  void copyToClipBoard(String text, BuildContext context) {
    _setClipBoard(text);
    _showSnackBar(
      context,
    );
  }

  void _setClipBoard(String text) {
    Clipboard.setData(
      ClipboardData(text: text),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(StringConstants.copiedToClipboard),
      ),
    );
  }
}
