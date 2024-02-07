import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// This widget is used to create a custom sized box
final class CustomSizedBox extends StatelessWidget {
  /// This widget is used to create a custom sized box
  const CustomSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.02),
    );
  }
}
