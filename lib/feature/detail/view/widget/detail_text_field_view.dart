import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/widget/custom_text_field.dart';

@RoutePage()

/// DetailTextFieldRoute
final class DetailTextFieldView extends StatelessWidget {
  /// Constructor
  const DetailTextFieldView({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomTextField(
            onChanged: (value) {
              context.read<TextRecognitionCacheManagerCubit>().updatePinned(
                    result: result.copyWith(text: value),
                    deleteResult: result,
                  );
            },
            isEditable: true,
            result,
          ),
        ),
      ),
    );
  }
}
