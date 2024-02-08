part of '../nav_bar.dart';

final class _NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _NavAppBar({
    required this.currentTab,
  });

  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          currentTab == 0 ? const Text('Image Picker') : const Text('Pinned'),
      actions: [
        if (currentTab == 1)
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<PostCacheManagerCubit>().deleteAllPinned();
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
