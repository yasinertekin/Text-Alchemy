import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_recognitions/product/model/result.dart';

/// Copy icon button
final class CopyIconButton extends StatelessWidget {
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
        if (result.text == null) {
          return;
        }
        Clipboard.setData(
          ClipboardData(text: result.text ?? ''),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Copied to clipboard'),
          ),
        );
      },
      icon: const Icon(Icons.copy),
    );
  }
}
