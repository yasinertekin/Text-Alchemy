import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// Custom image widget
final class CustomImage extends StatelessWidget {
  /// Constructor
  const CustomImage(
    this.imagePath, {
    super.key,
  });

  /// Image path
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.border.highBorderRadius,
      child: Image.file(
        File(
          imagePath,
        ),
        fit: BoxFit.contain,
        height: context.sized.dynamicHeight(0.3),
        width: double.infinity,
      ),
    );
  }
}
