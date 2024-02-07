import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/widget/copy_icon_button.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';
import 'package:text_recognitions/product/widget/custom_text_field.dart';

/// Detail view
@RoutePage()
final class DetailView extends StatelessWidget {
  /// Constructor
  const DetailView({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          CopyIconButton(
            result: result,
          ),
        ],
      ),
      body: ListView(
        children: [
          CustomImage(result.imagePath ?? ''),
          CustomTextField(
            isEditable: true,
            result,
          ),
        ],
      ),
    );
  }
}
