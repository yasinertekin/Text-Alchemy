part of '../detail_view.dart';

final class _DetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _DetailAppBar({
    required this.result,
    required this.controller,
  });

  final Result result;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.topRoute.name,
      ),
      actions: [
        CopyIconButton(result: result),
      ],
      leading: const AutoLeadingButton(),
      bottom: _DetailTabBar(
        controller,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
