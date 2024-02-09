import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_recognitions/feature/image/view_model/image_pickar_view_model.dart';
import 'package:text_recognitions/product/core/enum/image_data.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';

/// ImageSelect mixin
mixin ImageSelect {
  /// Select image from gallery or camera
  Future<void> selectImageFromGallery({
    required BuildContext context,
    required PageController pageController,
    required ImagePickerViewModel imagePickerViewModel,
  }) async {
    final image = await imagePickerViewModel.getImage();
    if (image == null) {
      return;
    }

    /// Push to image cropper route
    // ignore: use_build_context_synchronously
    await _navigator(context, image, pageController);
  }

  /// Select image from camera
  Future<void> selectImageFromCamera({
    required BuildContext context,
    required PageController pageController,
    required ImagePickerViewModel imagePickerViewModel,
  }) async {
    final image = await imagePickerViewModel.getCameraImage(
      context,
    );
    if (image == null) {
      return;
    }

    /// Push to image cropper route
    // ignore: use_build_context_synchronously
    await _navigator(context, image, pageController);
  }

  Future<void> _navigator(
    BuildContext context,
    File image,
    PageController pageController,
  ) async {
    /// Push to image cropper route
    // ignore: use_build_context_synchronously
    await context.router.push(
      ImageCropperRoute(
        image: image,
      ),
    );
    pageController.jumpToPage(ImageData.text.index);
  }
}
