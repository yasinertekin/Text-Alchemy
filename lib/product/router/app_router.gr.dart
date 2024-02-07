// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:text_recognitions/feature/detail/view/detail_veiw.dart' as _i1;
import 'package:text_recognitions/feature/image/view/image_picker_view.dart'
    as _i2;
import 'package:text_recognitions/feature/nav_bar/nav_bar.dart' as _i3;
import 'package:text_recognitions/feature/pinned/view/pinned_view.dart' as _i4;
import 'package:text_recognitions/product/model/result.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DetailTextFieldRoute.name: (routeData) {
      final args = routeData.argsAs<DetailTextFieldRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailTextFieldView(
          result: args.result,
          key: args.key,
        ),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailView(
          result: args.result,
          key: args.key,
        ),
      );
    },
    ImagePickerRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ImagePickerView(),
      );
    },
    ImageRoute.name: (routeData) {
      final args = routeData.argsAs<ImageRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ImageView(
          result: args.result,
          key: args.key,
        ),
      );
    },
    NavBar.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NavBar(),
      );
    },
    PinnedRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PinnedView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailTextFieldView]
class DetailTextFieldRoute extends _i5.PageRouteInfo<DetailTextFieldRouteArgs> {
  DetailTextFieldRoute({
    required _i6.Result result,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DetailTextFieldRoute.name,
          args: DetailTextFieldRouteArgs(
            result: result,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailTextFieldRoute';

  static const _i5.PageInfo<DetailTextFieldRouteArgs> page =
      _i5.PageInfo<DetailTextFieldRouteArgs>(name);
}

class DetailTextFieldRouteArgs {
  const DetailTextFieldRouteArgs({
    required this.result,
    this.key,
  });

  final _i6.Result result;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DetailTextFieldRouteArgs{result: $result, key: $key}';
  }
}

/// generated route for
/// [_i1.DetailView]
class DetailRoute extends _i5.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    required _i6.Result result,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            result: result,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i5.PageInfo<DetailRouteArgs> page =
      _i5.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    required this.result,
    this.key,
  });

  final _i6.Result result;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{result: $result, key: $key}';
  }
}

/// generated route for
/// [_i2.ImagePickerView]
class ImagePickerRoute extends _i5.PageRouteInfo<void> {
  const ImagePickerRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ImagePickerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImagePickerRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i1.ImageView]
class ImageRoute extends _i5.PageRouteInfo<ImageRouteArgs> {
  ImageRoute({
    required _i6.Result result,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ImageRoute.name,
          args: ImageRouteArgs(
            result: result,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageRoute';

  static const _i5.PageInfo<ImageRouteArgs> page =
      _i5.PageInfo<ImageRouteArgs>(name);
}

class ImageRouteArgs {
  const ImageRouteArgs({
    required this.result,
    this.key,
  });

  final _i6.Result result;

  final _i7.Key? key;

  @override
  String toString() {
    return 'ImageRouteArgs{result: $result, key: $key}';
  }
}

/// generated route for
/// [_i3.NavBar]
class NavBar extends _i5.PageRouteInfo<void> {
  const NavBar({List<_i5.PageRouteInfo>? children})
      : super(
          NavBar.name,
          initialChildren: children,
        );

  static const String name = 'NavBar';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PinnedView]
class PinnedRoute extends _i5.PageRouteInfo<void> {
  const PinnedRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PinnedRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinnedRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
