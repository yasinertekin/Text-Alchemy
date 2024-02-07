import 'package:auto_route/auto_route.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          page: NavBar.page,
          initial: true,
          children: [
            AdaptiveRoute(
              page: ImagePickerRoute.page,
            ),
            AdaptiveRoute(
              page: PinnedRoute.page,
            ),
          ],
        ),
        AdaptiveRoute(
          page: DetailRoute.page,
          path: '/detail',
          children: [
            AdaptiveRoute(
              page: ImageRoute.page,
            ),
            AdaptiveRoute(
              page: DetailTextFieldRoute.page,
            ),
          ],
        ),
      ];
}
