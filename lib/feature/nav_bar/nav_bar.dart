import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';

@RoutePage()

/// NavBar
final class NavBar extends StatelessWidget {
  /// Creates a [NavBar].
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Key myWidgetKey = UniqueKey();
    return AutoTabsScaffold(
      key: myWidgetKey,
      routes: const [
        ImagePickerRoute(),
        PinnedRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: 'Image Picker',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rate_rounded),
              label: 'Pinned',
            ),
          ],
        );
      },
    );
  }
}
