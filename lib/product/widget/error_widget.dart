import 'package:flutter/material.dart';

/// Error widget
final class ErrorWidget extends StatelessWidget {
  /// Constructor
  const ErrorWidget({
    required this.error,
    super.key,
  });

  /// Error message
  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
