part of '../pinned_view.dart';

final class _PinnedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _PinnedAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Favorite'),
      actions: const [
        _DeleteAllIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
