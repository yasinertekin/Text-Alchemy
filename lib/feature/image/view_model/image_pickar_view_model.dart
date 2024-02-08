import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:text_recognitions/product/image_picker/image_picker_interface.dart';
import 'package:text_recognitions/product/model/result.dart';

final class ImagePickerViewModel extends ChangeNotifier {
  ImagePickerViewModel(
    this.imagePicker,
  );
  final ImagePickerInterface imagePicker;
  final textRecognizer = TextRecognizer();
  Result? result;

  Future<File?> getImage() async {
    final pickedFile = await imagePicker.pickImage();
    return pickedFile;
  }

  Future<File?> getCameraImage() async {
    final pickedFile = await imagePicker.takePicture();
    return pickedFile;
  }

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
