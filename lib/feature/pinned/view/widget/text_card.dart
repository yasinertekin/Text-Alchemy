part of '../pinned_view.dart';

final class _TextCard extends StatelessWidget
    with CopyClipBoard, TextCardDialog {
  const _TextCard({
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context) {
    final uniqueKey = UniqueKey();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async {
          return textCardDialog(context, result);
        },
        key: uniqueKey,
        background: const ColoredBox(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          context.read<PostCacheManagerCubit>().deletePinned(result.id ?? '');
        },
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: CustomImage(
              result.imagePath ?? '',
              height: 0.1,
              width: context.sized.dynamicWidth(0.2),
            ),
            onLongPress: () {
              copyToClipBoard(result.text ?? '', context);
            },
            onTap: () {
              context.router.push(
                DetailRoute(result: result),
              );
            },
            title: Text(
              result.text ?? 'No text found',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: CopyIconButton(
              result: result,
            ),
          ),
        ),
      ),
    );
  }
}
