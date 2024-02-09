import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/image/view_model/image_pickar_view_model.dart';
import 'package:text_recognitions/feature/image_cropper/view_model/image_cropper_view_model.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';

part 'widget/image_crop_button.dart';
part 'widget/image_cropper_app_bar.dart';
part 'widget/image_cropper_options.dart';
part 'widget/process_image_button.dart';

@RoutePage()

/// ImageCropperView
final class ImageCropperView extends StatelessWidget {
  /// Constructor
  const ImageCropperView({
    required this.image,
    super.key,
  });

  /// Image
  final File image;

  @override
  Widget build(BuildContext context) {
    return ImageCropperBody(
      image: image,
    );
  }
}

/// ImageCropperBody
final class ImageCropperBody extends StatelessWidget {
  /// Constructor
  const ImageCropperBody({
    required this.image,
    super.key,
  });

  /// Image
  final File image;

  @override
  Widget build(BuildContext context) {
    final viewModel = ImageCropperViewModel();
    final imageProvider = context.read<ImagePickerViewModel>();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Scaffold(
        appBar: const _ImageCropperAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (viewModel.image != null)
                CustomImage(
                  viewModel.image!.path,
                  height: 0.8,
                )
              else
                CustomImage(
                  image.path,
                  height: 0.8,
                ),
              _ImageCropperOptions(
                viewModel: viewModel,
                result: image,
                imageProvider: imageProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
