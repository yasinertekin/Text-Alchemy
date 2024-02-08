part of '../detail_view.dart';

final class _DetailTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _DetailTabBar(
    this.controller,
  );

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: const [
        Tab(
          text: 'Text',
          icon: Icon(Icons.text_fields_rounded),
        ),
        Tab(
          text: 'Image',
          icon: Icon(
            Icons.image,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
