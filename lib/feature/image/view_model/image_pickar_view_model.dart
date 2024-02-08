import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:text_recognitions/product/image_picker/image_picker_interface.dart';
import 'package:text_recognitions/product/model/result.dart';

/// ImagePickerViewModel is used to pick image from gallery or camera
final class ImagePickerViewModel extends ChangeNotifier {
  /// ImagePickerViewModel constructor
  ImagePickerViewModel(
    this.imagePicker,
  );

  ///  imagePicker is used to pick image from gallery or camera
  final ImagePickerInterface imagePicker;

  /// textRecognizer is used to recognize text from image
  final textRecognizer = TextRecognizer();

  /// Result model
  Result? result;

  /// Get image from gallery
  Future<File?> getImage() async {
    final pickedFile = await imagePicker.pickImage();
    return pickedFile;
  }

  /// Get image from camera
  Future<File?> getCameraImage() async {
    final pickedFile = await imagePicker.takePicture();
    return pickedFile;
  }

  /// Process image
  Future<void> processImage(File pickedFile) async {
    final imagePath = pickedFile.path;
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await textRecognizer.processImage(inputImage);
    final text = recognizedText.text;

    result = Result(
      text: text,
      imagePath: imagePath,
    );

    notifyListeners();
  }

  /// Update textdd
  void updateText(String text) {
    result = result!.copyWith(text: text);
    notifyListeners();
  }

  /// Update image path
  void updateImagePath(String imagePath) {
    result = result!.copyWith(imagePath: imagePath);
    notifyListeners();
  }
}
