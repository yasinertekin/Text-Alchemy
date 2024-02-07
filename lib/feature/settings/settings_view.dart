import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/product/initialize/theme/cubit/theme_cubit.dart';

final class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        context.read<ThemeCubit>().changeTheme(
              brightness: Theme.of(context).brightness,
            );
      },
    );
  }
}
