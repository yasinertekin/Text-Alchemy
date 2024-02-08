part of '../pinned_view.dart';

final class _LoadedWidget extends StatelessWidget {
  const _LoadedWidget({
    required this.resultList,
  });

  final List<Result> resultList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        final result = resultList[index];
        return _TextCard(result: result);
      },
    );
  }
}
