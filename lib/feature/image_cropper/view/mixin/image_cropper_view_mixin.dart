import 'package:text_recognitions/feature/image_cropper/view/image_cropper_view.dart';
import 'package:text_recognitions/feature/image_cropper/view_model/image_cropper_view_model.dart';

/// ImageCropperViewMixin
mixin ImageCropperViewMixin<StatelessWidget extends ImageCropperView> {
  /// ViewModel
  final _viewModel = ImageCropperViewModel();

  /// ViewModel getter
  ImageCropperViewModel get viewModel => _viewModel;
}
