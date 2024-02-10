import 'package:flutter/material.dart';
import 'package:text_recognitions/feature/image/view/image_picker_view.dart';

/// ImagePickerViewMixin is used to pick image from gallery or camera
mixin ImagePickermixin<StatalesWidget extends ImagePickerView> {
  /// PageController for image picker
  final _pageController = PageController();

  /// PageController for image picker
  PageController get pageController => _pageController;
}
