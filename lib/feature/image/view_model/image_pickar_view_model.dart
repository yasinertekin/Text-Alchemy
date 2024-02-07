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

  Future<void> pickImage() async {
    final pickedFile = await imagePicker.pickImage();
    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      final text = await _setImagePath(imagePath);
      result = Result(
        imagePath: imagePath,
        text: text,
      );

      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<String> _setImagePath(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await textRecognizer.processImage(inputImage);
    final text = recognizedText.text;
    return text;
  }

  /// Update textdd
  void updateText(String text) {
    result = result!.copyWith(text: text);
    notifyListeners();
  }

  Future<void> takePicture() async {
    final pickedFile = await imagePicker.takePicture();
    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      final text = await _setImagePath(imagePath);
      result = Result(
        imagePath: imagePath,
        text: text,
      );

      notifyListeners();
    } else {
      print('No image selected.');
    }
  }
}
