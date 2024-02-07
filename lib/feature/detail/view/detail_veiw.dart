import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';
import 'package:text_recognitions/product/widget/copy_icon_button.dart';
import 'package:text_recognitions/product/widget/custom_image.dart';
import 'package:text_recognitions/product/widget/custom_text_field.dart';

/// Detail view
@RoutePage()
final class DetailView extends StatelessWidget {
  /// Constructor
  const DetailView({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    final Key myWidgetKey = UniqueKey();

    return AutoTabsRouter.tabBar(
      key: myWidgetKey,
      routes: [
        DetailTextFieldRoute(result: result),
        ImageRoute(result: result),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.topRoute.name,
            ),
            actions: [
              CopyIconButton(result: result),
            ],
            leading: const AutoLeadingButton(),
            bottom: _CustomTabBar(
              controller,
            ),
          ),
          body: child,
        );
      },
    );
  }
}

final class _CustomTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomTabBar(
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

@RoutePage()

/// DetailTextFieldRoute
final class DetailTextFieldView extends StatelessWidget {
  /// Constructor
  const DetailTextFieldView({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomTextField(
            onChanged: (value) {
              context.read<PostCacheManagerCubit>().updatePinned(
                    result: result.copyWith(text: value),
                    deleteResult: result,
                  );
            },
            isEditable: true,
            result,
          ),
        ),
      ),
    );
  }
}

@RoutePage()

/// ImageView
final class ImageView extends StatelessWidget {
  /// Constructor
  const ImageView({
    required this.result,
    super.key,
  });

  /// Result model
  final Result result;

  @override
  Widget build(BuildContext context) {
    return CustomImage(
      result.imagePath ?? '',
    );
  }
}
