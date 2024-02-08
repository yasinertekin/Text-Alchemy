part of '../image_cropper_view.dart';

final class _ImageCropperAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ImageCropperAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Image Cropper'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
