// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i9;

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:text_recognitions/feature/detail/view/detail_veiw.dart' as _i1;
import 'package:text_recognitions/feature/image/view/image_picker_view.dart'
    as _i3;
import 'package:text_recognitions/feature/image_cropper/view/image_cropper_view.dart'
    as _i2;
import 'package:text_recognitions/feature/nav_bar/nav_bar.dart' as _i4;
import 'package:text_recognitions/feature/pinned/view/pinned_view.dart' as _i5;
import 'package:text_recognitions/product/model/result.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DetailTextFieldRoute.name: (routeData) {
      final args = routeData.argsAs<DetailTextFieldRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailTextFieldView(
          result: args.result,
          key: args.key,
        ),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailView(
          result: args.result,
          key: args.key,
        ),
      );
    },
    ImageCropperRoute.name: (routeData) {
      final args = routeData.argsAs<ImageCropperRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ImageCropperView(
          image: args.image,
          key: args.key,
        ),
      );
    },
    ImagePickerRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ImagePickerView(),
      );
    },
    ImageRoute.name: (routeData) {
      final args = routeData.argsAs<ImageRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ImageView(
          result: args.result,
          key: args.key,
        ),
      );
    },
    NavBar.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NavBar(),
      );
    },
    PinnedRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PinnedView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailTextFieldView]
class DetailTextFieldRoute extends _i6.PageRouteInfo<DetailTextFieldRouteArgs> {
  DetailTextFieldRoute({
    required _i7.Result result,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DetailTextFieldRoute.name,
          args: DetailTextFieldRouteArgs(
            result: result,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailTextFieldRoute';

  static const _i6.PageInfo<DetailTextFieldRouteArgs> page =
      _i6.PageInfo<DetailTextFieldRouteArgs>(name);
}

class DetailTextFieldRouteArgs {
  const DetailTextFieldRouteArgs({
    required this.result,
    this.key,
  });

  final _i7.Result result;

  final _i8.Key? key;

  @override
  String toString() {
    return 'DetailTextFieldRouteArgs{result: $result, key: $key}';
  }
}

/// generated route for
/// [_i1.DetailView]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    required _i7.Result result,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            result: result,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i6.PageInfo<DetailRouteArgs> page =
      _i6.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    required this.result,
    this.key,
  });

  final _i7.Result result;

  final _i8.Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{result: $result, key: $key}';
  }
}

/// generated route for
/// [_i2.ImageCropperView]
class ImageCropperRoute extends _i6.PageRouteInfo<ImageCropperRouteArgs> {
  ImageCropperRoute({
    required _i9.File image,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ImageCropperRoute.name,
          args: ImageCropperRouteArgs(
            image: image,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageCropperRoute';

  static const _i6.PageInfo<ImageCropperRouteArgs> page =
      _i6.PageInfo<ImageCropperRouteArgs>(name);
}

class ImageCropperRouteArgs {
  const ImageCropperRouteArgs({
    required this.image,
    this.key,
  });

  final _i9.File image;

  final _i8.Key? key;

  @override
  String toString() {
    return 'ImageCropperRouteArgs{image: $image, key: $key}';
  }
}

/// generated route for
/// [_i3.ImagePickerView]
class ImagePickerRoute extends _i6.PageRouteInfo<void> {
  const ImagePickerRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ImagePickerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImagePickerRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i1.ImageView]
class ImageRoute extends _i6.PageRouteInfo<ImageRouteArgs> {
  ImageRoute({
    required _i7.Result result,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ImageRoute.name,
          args: ImageRouteArgs(
            result: result,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageRoute';

  static const _i6.PageInfo<ImageRouteArgs> page =
      _i6.PageInfo<ImageRouteArgs>(name);
}

class ImageRouteArgs {
  const ImageRouteArgs({
    required this.result,
    this.key,
  });

  final _i7.Result result;

  final _i8.Key? key;

  @override
  String toString() {
    return 'ImageRouteArgs{result: $result, key: $key}';
  }
}

/// generated route for
/// [_i4.NavBar]
class NavBar extends _i6.PageRouteInfo<void> {
  const NavBar({List<_i6.PageRouteInfo>? children})
      : super(
          NavBar.name,
          initialChildren: children,
        );

  static const String name = 'NavBar';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PinnedView]
class PinnedRoute extends _i6.PageRouteInfo<void> {
  const PinnedRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PinnedRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinnedRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
