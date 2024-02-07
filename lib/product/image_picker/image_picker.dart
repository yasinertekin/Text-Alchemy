import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:text_recognitions/product/image_picker/image_picker_interface.dart';

/// ImagePickers
final class ImagePickers extends ImagePickerInterface {
  /// Constructor
  ImagePickers(super.imagePicker);

  @override
  Future<File?> pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  @override
  Future<File?> takePicture() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
