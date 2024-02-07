import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/product/model/result.dart';

/// Custom text field
final class CustomTextField extends StatelessWidget {
  /// Constructor
  const CustomTextField(
    this.result, {
    super.key,
    this.isEditable = false,
  });

  /// Result model
  final Result result;

  /// Is editable
  final bool isEditable;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      onSubmitted: (value) {
        context.read<PostCacheManagerCubit>().updatePinned(
              result: result.copyWith(text: value),
              deleteResult: result,
            );
      },
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
