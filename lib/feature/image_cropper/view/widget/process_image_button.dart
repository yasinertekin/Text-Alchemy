part of '../image_cropper_view.dart';

final class _ProcessImageButton extends StatelessWidget {
  const _ProcessImageButton({
    required this.viewModel,
    required this.imageProvider,
    required this.result,
  });

  final ImageCropperViewModel viewModel;
  final ImagePickerViewModel imageProvider;
  final File result;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (viewModel.image != null) {
          await imageProvider.processImage(viewModel.image!);
        } else {
          await imageProvider.processImage(result);
        }

        await context.router.pop();
      },
      child: const Text('Save Image'),
    );
  }
}