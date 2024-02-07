part of '../image_picker_view.dart';

final class _ImagePickerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ImagePickerAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: const Text('Image Picker Example'),
      actions: const <Widget>[
        SettingsView(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
