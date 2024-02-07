import 'package:flutter/material.dart';

/// Custom loading widget
final class CustomLoading extends StatelessWidget {
  /// Constructor
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
