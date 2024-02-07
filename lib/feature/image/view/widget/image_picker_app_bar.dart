part of '../image_picker_view.dart';

final class _ImagePickerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ImagePickerAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Image Picker Example'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
