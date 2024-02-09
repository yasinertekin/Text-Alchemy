part of '../nav_bar.dart';

final class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer();

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
            title: const Text(StringConstants.changeTheme),
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
