part of '../pinned_view.dart';

final class _DeleteIconButton extends StatelessWidget {
  const _DeleteIconButton({
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        context.read<PostCacheManagerCubit>().deletePinned(result.id ?? '');
      },
    );
  }
}
