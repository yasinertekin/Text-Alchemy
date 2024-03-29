import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/initialize/app_initialize.dart';
import 'package:text_recognitions/product/initialize/app_state_initialize.dart';
import 'package:text_recognitions/product/initialize/theme/cubit/theme_cubit.dart';
import 'package:text_recognitions/product/initialize/theme/dark/app_theme.dark.dart';
import 'package:text_recognitions/product/initialize/theme/light/app_theme_light.dart';
import 'package:text_recognitions/product/router/app_router.dart';

void main() async {
  await AppInitialize.initialize();
  runApp(
    AppStateInitialize(
      child: _MyApp(),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  _MyApp();
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          /// This is the title of the app
          title: StringConstants.appName,

          /// This is the theme of the app
          theme: AppThemeLight().theme,
          darkTheme: AppThemeDark().theme,
          themeMode: state.themeMode,

          debugShowCheckedModeBanner: false,

          /// This is the router of the app
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
