part of '../pinned_view.dart';

final class _TextCard extends StatelessWidget with CopyClipBoard {
  const _TextCard({
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        child: ListTile(
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
          trailing: _DeleteIconButton(result: result),
        ),
      ),
    );
  }
}
