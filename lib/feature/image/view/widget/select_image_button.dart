part of '../image_picker_view.dart';

final class _SelectImageButton extends StatelessWidget with ImageSelect {
  const _SelectImageButton({
    required this.imagePickerViewModel,
    required this.pageController,
  });

  final ImagePickerViewModel imagePickerViewModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await selectImageFromGallery(
          context: context,
          imagePickerViewModel: imagePickerViewModel,
          pageController: pageController,
        );
      },
      child: imagePickerViewModel.result?.imagePath == null
          ? _ImageIsEmptyWidget(
              imagePickerViewModel: imagePickerViewModel,
              pageController: pageController,
            )
          : CustomImage(
              imagePickerViewModel.result?.imagePath ?? '',
            ),
    );
  }
}
