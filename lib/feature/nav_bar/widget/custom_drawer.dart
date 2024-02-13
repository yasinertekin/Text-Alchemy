part of '../nav_bar.dart';

final class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer();

  @override
  Widget build(BuildContext context) {
    final drawerList = DrawerModelLists.drawerItems(context);
    return Drawer(
      child: Column(
        children: [
          const _CustomDrawerHeader(),
          _DrawerListViewBuilder(drawerList: drawerList),
        ],
      ),
    );
  }
}

final class _CustomDrawerHeader extends StatelessWidget {
  const _CustomDrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: ClipRRect(
        borderRadius: context.border.normalBorderRadius,
        child: Image.asset(
          ImageConstants.appLogo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

final class _DrawerListViewBuilder extends StatelessWidget {
  const _DrawerListViewBuilder({
    required this.drawerList,
  });

  final List<DrawerModel> drawerList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: drawerList.length,
        itemBuilder: (context, index) {
          final drawerItem = drawerList[index];
          return _DrawerItemListTile(drawerItem: drawerItem);
        },
      ),
    );
  }
}

final class _DrawerItemListTile extends StatelessWidget {
  const _DrawerItemListTile({
    required this.drawerItem,
  });

  final DrawerModel drawerItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(drawerItem.title),
      trailing: drawerItem.trailing,
      onTap: drawerItem.onTap,
    );
  }
}

/// DrawerModelLists is a model class for the drawer items.
@immutable
final class DrawerModelLists {
  const DrawerModelLists._();

  /// DrawerModelLists is a model class for the drawer items.
  static List<DrawerModel> drawerItems(BuildContext context) {
    return [
      DrawerModel(
        title: 'Share',
        trailing: const Icon(Icons.share),
        onTap: () {},
      ),
      DrawerModel(
        title: 'Change Theme',
        trailing: Theme.of(context).brightness == Brightness.dark
            ? const Icon(Icons.brightness_7)
            : const Icon(Icons.brightness_4),
        onTap: () {
          context.read<ThemeCubit>().changeTheme(
                brightness: Theme.of(context).brightness,
              );
        },
      ),
    ];
  }
}
