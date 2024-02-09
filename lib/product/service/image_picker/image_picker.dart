import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/service/image_picker/image_picker_interface.dart';
import 'package:text_recognitions/product/utility/custom_exception.dart';

/// ImagePickers
final class ImagePickers extends ImagePickerInterface {
  /// Constructor
  ImagePickers(super.imagePicker);

  @override
  Future<File?> pickImage() async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw CustomException('${StringConstants.imageError} $e');
    }
  }

  @override
  Future<File?> takePicture() async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw CustomException('Please give camera permission $e');
    }
  }
}
