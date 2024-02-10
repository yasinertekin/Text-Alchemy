import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/image/view_model/image_pickar_view_model.dart';
import 'package:text_recognitions/feature/image_cropper/view/mixin/image_cropper_view_mixin.dart';
import 'package:text_recognitions/feature/image_cropper/view_model/image_cropper_view_model.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';

part 'widget/image_crop_button.dart';
part 'widget/image_cropper_app_bar.dart';
part 'widget/image_cropper_options.dart';
part 'widget/process_image_button.dart';

@RoutePage()

/// ImageCropperView
final class ImageCropperView extends StatelessWidget
    with ImageCropperViewMixin<ImageCropperView> {
  /// Constructor
  ImageCropperView({
    required this.image,
    super.key,
  });

  /// Image
  final File image;

  @override
  Widget build(BuildContext context) {
    final imageProvider = context.read<ImagePickerViewModel>();

    return ImageCropperBody(
      image: image,
      viewModel: viewModel,
      imageProvider: imageProvider,
    );
  }
}

/// ImageCropperBody
final class ImageCropperBody extends StatelessWidget {
  /// Constructor
  const ImageCropperBody({
    required this.image,
    required this.viewModel,
    required this.imageProvider,
    super.key,
  });

  /// Image
  final File image;

  /// ViewModel
  final ImageCropperViewModel viewModel;

  /// ImageProvider
  final ImagePickerViewModel imageProvider;

  @override
  Widget build(BuildContext context) {
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
