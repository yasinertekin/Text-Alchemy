import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';

@RoutePage()

/// ImageView
final class ImageView extends StatelessWidget {
  /// Constructor
  const ImageView({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    return CustomImage(
      result.imagePath,
    );
  }
}
