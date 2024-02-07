import 'package:bloc/bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:text_recognitions/product/image_picker/image_picker_interface.dart';
import 'package:text_recognitions/product/model/result.dart';

enum ImagePickerStatus { initial, loading, success, error }

final class ImagePickerCubit extends Cubit<ImagePickerStatus> {
  ImagePickerCubit(this.imagePicker) : super(ImagePickerStatus.initial);

  final ImagePickerInterface imagePicker;
  final textRecognizer = TextRecognizer();
  Result? result;

  Future<void> pickImage() async {
    emit(ImagePickerStatus.loading);
    final pickedFile = await imagePicker.pickImage();
    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      final text = await _setImagePath(imagePath);
      result = Result(
        imagePath: imagePath,
        text: text,
      );

      emit(ImagePickerStatus.success);
    } else {
      emit(ImagePickerStatus.error);
    }
  }

  Future<String> _setImagePath(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await textRecognizer.processImage(inputImage);
    final text = recognizedText.text;
    return text;
  }
}
