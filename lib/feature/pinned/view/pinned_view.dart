import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_cubit.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/product/router/app_router.gr.dart';

@RoutePage()
final class PinnedView extends StatelessWidget {
  const PinnedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: BlocBuilder<PostCacheManagerCubit, PinnedCacheManagerState>(
        builder: (context, state) {
          if (state is PinnedCacheManagerInitialState) {
            // Initial state, you can show loading indicator or initial content
            return const CircularProgressIndicator();
          } else if (state is PinnedCacheManagerLoadedState) {
            // Data loaded, use state.posts to display the posts
            final resultList = state.result;
            return ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                final result = resultList[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        context.router.push(
                          DetailRoute(result: result),
                        );
                      },
                      title: Text(
                        result.text ?? 'No text found',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<PostCacheManagerCubit>()
                              .deletePinned(result.id ?? '');
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is PinnedCacheManagerErrorState) {
            // Error state, display an error message
            return Text('Error: ${state.error}');
          } else {
            return const Text('Error: Unhandled state');
          }
        },
      ),
    );
  }
}
