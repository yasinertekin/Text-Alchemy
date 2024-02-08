import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

/// ImageCropperViewModel
final class ImageCropperViewModel extends ChangeNotifier {
  /// Image
  File? image;

  /// Image cropper
  Future<void> imageCropper(String imagesPath, BuildContext context) async {
    final cropper = await ImageCropper().cropImage(
      sourcePath: imagesPath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio7x5,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Theme.of(context).colorScheme.primary,
          toolbarWidgetColor: Theme.of(context).colorScheme.onPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          cropFrameColor: Theme.of(context).colorScheme.primary,
          cropGridColor: Colors.red,
          showCropGrid: false,
        ),
      ],
    );

    if (cropper != null) {
      image = File(cropper.path);
      notifyListeners();
    }
  }
}