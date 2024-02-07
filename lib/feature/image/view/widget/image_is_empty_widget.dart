part of '../image_picker_view.dart';

final class _ImageIsEmptyWidget extends StatelessWidget {
  const _ImageIsEmptyWidget({
    required this.imagePickerViewModel,
    required this.pageController,
  });
  final ImagePickerViewModel imagePickerViewModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await imagePickerViewModel.pickImage();
        if (imagePickerViewModel.result?.imagePath == null) {
          return;
        }
        await pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: const Icon(
        Icons.image,
        size: 100,
      ),
    );
  }
}
