import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/product/mixin/copy_clipboard.dart';
import 'package:text_recognitions/product/model/result.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';
import 'package:text_recognitions/product/widget/custom_loading.dart';
import 'package:text_recognitions/product/widget/undefined_widget.dart';

part 'widget/delete_all_icon_button.dart';
part 'widget/delete_icon_button.dart';
part 'widget/pinned_app_bar.dart';
part 'widget/text_card.dart';

@RoutePage()

/// Pinned view
final class PinnedView extends StatelessWidget {
  /// Constructor
  const PinnedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _PinnedAppBar(),
      body: BlocBuilder<PostCacheManagerCubit, PinnedCacheManagerState>(
        builder: (context, state) {
          if (state is PinnedCacheManagerInitialState) {
            // Initial state, you can show loading indicator or initial content
            return const CustomLoading();
          } else if (state is PinnedCacheManagerLoadedState) {
            // Data loaded, use state.posts to display the posts
            final resultList = state.result;
            return _LoadedWidget(resultList: resultList);
          } else if (state is PinnedCacheManagerErrorState) {
            // Error state, display an error message
            return ErrorWidget(
              'Error fetching posts: $state.error',
            );
          } else {
            return const UndefinedWidget();
          }
        },
      ),
    );
  }
}

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
