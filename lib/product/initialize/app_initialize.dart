import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_recognitions/locators.dart';

@immutable

/// AppInitialize
abstract final class AppInitialize {
  /// Initialize the app
  static Future<void> initialize() async {
    await Hive.initFlutter();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
    await Locators.setup();
  }
}
