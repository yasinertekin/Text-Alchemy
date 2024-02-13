import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/product/core/constants/image_constants.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/initialize/theme/cubit/theme_cubit.dart';
import 'package:text_recognitions/product/model/drawer/drawer_model.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';

part 'widget/custom_drawer.dart';
part 'widget/nav_app_bar.dart';

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
      appBarBuilder: (_, tabsRouter) {
        final currentTab = tabsRouter.activeIndex;
        return _NavAppBar(currentTab: currentTab);
      },
      drawer: const _CustomDrawer(),
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
              icon: Icon(Icons.image_sharp),
              label: StringConstants.navBarHome,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rate_rounded),
              label: StringConstants.navBarPinned,
            ),
          ],
        );
      },
    );
  }
}
