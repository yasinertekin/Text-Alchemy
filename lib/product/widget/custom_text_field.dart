import 'package:flutter/material.dart';
import 'package:text_recognitions/product/model/result.dart';

/// Custom text field
final class CustomTextField extends StatelessWidget {
  /// Constructor
  const CustomTextField(
    this.result, {
    required this.onChanged,
    super.key,
    this.isEditable = false,
  });

  /// Result model
  final Result result;

  /// Is editable
  final bool isEditable;

  /// On changed
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      onSubmitted: onChanged,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      controller: TextEditingController(
        text: result.text,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
