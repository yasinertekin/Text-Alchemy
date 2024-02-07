import 'package:flutter/material.dart';

/// Undefined widget
final class UndefinedWidget extends StatelessWidget {
  /// Constructor
  const UndefinedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Error: Unhandled state');
  }
}
