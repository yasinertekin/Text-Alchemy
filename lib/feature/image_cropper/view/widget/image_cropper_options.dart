part of '../image_cropper_view.dart';

final class _ImageCropperOptions extends StatelessWidget {
  const _ImageCropperOptions({
    required this.viewModel,
    required this.result,
    required this.imageProvider,
  });

  final ImageCropperViewModel viewModel;
  final File result;
  final ImagePickerViewModel imageProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ImageCropButton(viewModel: viewModel, result: result),
        _ProcessImageButton(
          viewModel: viewModel,
          imageProvider: imageProvider,
          result: result,
        ),
      ],
    );
  }
}
