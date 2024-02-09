part of '../nav_bar.dart';

final class _NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _NavAppBar({
    required this.currentTab,
  });

  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: currentTab == 0
          ? const Text(StringConstants.appName)
          : const Text(StringConstants.navBarPinned),
      actions: [
        if (currentTab == 1)
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context
                  .read<TextRecognitionCacheManagerCubit>()
                  .deleteAllPinned();
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
