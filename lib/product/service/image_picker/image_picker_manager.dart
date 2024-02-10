import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognitions/product/service/image_picker/image_picker.dart';

@immutable

/// Image manager
final class ImageManager {
  /// Image manager
  factory ImageManager() {
    return const ImageManager._();
  }
  const ImageManager._();

  /// Create image manager
  ImagePickers createImageManager() {
    return ImagePickers(
      ImagePicker(),
    );
  }
}
