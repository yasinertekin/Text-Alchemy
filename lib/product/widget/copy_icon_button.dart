import 'package:flutter/material.dart';
import 'package:text_recognitions/product/mixin/copy_clipboard.dart';
import 'package:text_recognitions/product/model/result.dart';

/// Copy icon button
final class CopyIconButton extends StatelessWidget with CopyClipBoard {
  /// Constructor
  const CopyIconButton({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        copyToClipBoard(result.text ?? '', context);
      },
      icon: const Icon(Icons.copy),
    );
  }
}
