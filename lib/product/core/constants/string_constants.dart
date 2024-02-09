import 'package:flutter/material.dart';

@immutable

/// This class contains all the string constants used in the app
final class StringConstants {
  const StringConstants._();

  /// This is the title of the app
  static const String appName = 'Text Recognitions';

  /// Detail tab bar text
  static const String textTab = 'Text';

  /// Detail tab bar image
  static const String imageTab = 'Image';

  /// Text is empty
  static const String textIsEmpty = 'Text is empty';

  /// Image Cropper
  static const String imageCropper = 'Image Cropper';

  /// Crop Image
  static const String cropImage = 'Crop Image';

  /// Process Image
  static const String processImage = 'Process Image';

  /// Nav Bar
  static const String navBarHome = 'Text Recognitions';

  /// Pinned
  static const String navBarPinned = 'Pinned';

  /// Drawer
  static const String changeTheme = 'Change Theme';

  /// Pinned View
  static const String deleteAll = 'Delete All';

  /// No text found
  static const String noTextFound = 'No text found';

  /// Error fetching textrecognition
  static const String errorFetchingTextRecognition =
      'Error fetching textrecognition: ';

  /// Error updating textrecognition
  static const String errorUpdatingTextRecognition =
      'Error updating textrecognition: ';

  /// Error deleting textrecognition
  static const String errorDeletingTextRecognition =
      'Error deleting textrecognition: ';

  /// Error Adding textrecognition
  static const String errorAddingTextRecognition =
      'Error adding textrecognition: ';
}
