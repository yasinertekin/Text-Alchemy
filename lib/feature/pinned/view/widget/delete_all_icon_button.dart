part of '../pinned_view.dart';

final class _DeleteAllIconButton extends StatelessWidget {
  const _DeleteAllIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_forever_rounded),
      onPressed: () {
        context.read<PostCacheManagerCubit>().deleteAllPinned();
      },
    );
  }
}
