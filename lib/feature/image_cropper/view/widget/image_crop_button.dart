part of '../image_cropper_view.dart';

final class _ImageCropButton extends StatelessWidget {
  const _ImageCropButton({
    required this.viewModel,
    required this.result,
  });

  final ImageCropperViewModel viewModel;
  final File result;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await viewModel.imageCropper(
          result.path,
          context,
        );
      },
      child: const Text('Crop Image'),
    );
  }
}
