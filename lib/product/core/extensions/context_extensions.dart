import 'package:flutter/material.dart';

/// This extension contains all the context extensions used in the app
extension MediaQueryExtension on BuildContext {
  /// Returns the media query of the device
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the height of the device
  double get height => MediaQuery.sizeOf(this).height;

  /// Returns the width of the device
  double get width => MediaQuery.sizeOf(this).width;

  /// Returns 1% of the screen height
  double get lowValue => height * 0.01;

  /// Default value is 2% of the screen height
  double get defaultValue => height * 0.02;

  /// Returns 5% of the screen height
  double get highValue => height * 0.05;
}

/// This extension contains all the context extensions used in the app
extension PaddingExtension on BuildContext {
  /// Adds 2% padding from all sides.
  EdgeInsets get paddingAllDefault => EdgeInsets.all(defaultValue);

  /// Adds 5% padding from all sides.
  EdgeInsets get paddingAllHigh => EdgeInsets.all(highValue);

  /// Adds 2% padding from the top.
  EdgeInsets get paddingOnlyRight => EdgeInsets.only(right: defaultValue);
}
