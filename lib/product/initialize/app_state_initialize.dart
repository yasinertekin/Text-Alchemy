import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:text_recognitions/feature/image/view_model/image_pickar_view_model.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/product/core/cache/pinned_manager.dart';
import 'package:text_recognitions/product/initialize/theme/cubit/theme_cubit.dart';
import 'package:text_recognitions/product/service/image_picker/image_picker.dart';

/// AppStateInitialize
final class AppStateInitialize extends StatelessWidget {
  /// Constructor
  const AppStateInitialize({
    required this.child,
    super.key,
  });

  /// Child widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCacheManagerCubit(
            PinnedManager.createCacheManager(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        ChangeNotifierProvider<ImagePickerViewModel>(
          create: (context) => ImagePickerViewModel(
            ImagePickers(
              ImagePicker(),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
