part of '../image_picker_view.dart';

final class _ImagePickerDrawer extends StatelessWidget {
  const _ImagePickerDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: const Text(
              'Drawer Header',
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.settings),
            title: const Text('Change Theme'),
            onTap: () {
              context.read<ThemeCubit>().changeTheme(
                    brightness: Theme.of(context).brightness,
                  );
            },
          ),
        ],
      ),
    );
  }
}
