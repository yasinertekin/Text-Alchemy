import 'package:auto_route/auto_route.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          initial: true,
          page: NavBar.page,
          children: [
            AdaptiveRoute(
              initial: true,
              page: ImagePickerRoute.page,
            ),
            AdaptiveRoute(
              page: DetailRoute.page,
            ),
            AdaptiveRoute(
              page: PinnedRoute.page,
            ),
          ],
        ),
        AdaptiveRoute(page: DetailRoute.page),
      ];
}
