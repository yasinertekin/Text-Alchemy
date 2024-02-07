import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerInterface {
  ImagePickerInterface(this.imagePicker);
  Future<File?> pickImage();
  Future<File?> takePicture();
  final ImagePicker imagePicker;
}
