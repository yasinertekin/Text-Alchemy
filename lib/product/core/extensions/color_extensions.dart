import 'package:flutter/material.dart';

/// Project color enum
enum ProjectColor {
  /// Colors red
  colorsRed,

  /// Color White
  colorsWhite,

  /// Colors Transparent
  colorsTransparent,
}

/// Project color
extension ColorExtension on ProjectColor {
  /// Get color
  Color get color {
    switch (this) {
      case ProjectColor.colorsRed:
        return const Color(0xFFE57373);
      case ProjectColor.colorsWhite:
        return const Color(0xFFFFFFFF);
      case ProjectColor.colorsTransparent:
        return const Color(0x00000000);
    }
  }
}
