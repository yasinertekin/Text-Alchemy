import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/product/core/extensions/context_extensions.dart';
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
      padding: context.paddingAllDefault,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: context.border.normalBorderRadius,
          side: const BorderSide(),
        ),
        child: Padding(
          padding: context.paddingAllDefault,
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
