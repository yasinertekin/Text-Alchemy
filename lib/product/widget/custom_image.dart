import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// Custom image widget

final class CustomImage extends StatelessWidget {
  /// Constructor
  const CustomImage(
    this.imagePath, {
    super.key,
    this.height = 0.3,
    this.width = double.infinity,
    this.borderRadius = BorderRadius.zero,
  });

  /// Image path
  final String imagePath;

  /// Height
  final double height;

  /// Width
  final double width;

  /// Border radius
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.file(
        File(
          imagePath,
        ),
        fit: BoxFit.contain,
        height: context.sized.dynamicHeight(height),
        width: width,
      ),
    );
  }
}
