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
    const iconSize = 100.0;
    return const Icon(
      Icons.image,
      size: iconSize,
    );
  }
}
