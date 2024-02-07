import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// ImagePickerInterface
abstract class ImagePickerInterface {
  /// Constructor
  ImagePickerInterface(this.imagePicker);

  /// Pick image
  Future<File?> pickImage();

  /// Take picture
  Future<File?> takePicture();

  /// Image picker
  final ImagePicker imagePicker;
}
