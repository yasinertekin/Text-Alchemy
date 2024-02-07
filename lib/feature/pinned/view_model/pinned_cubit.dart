// Implement the Cubit

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/product/core/cache/cache_manager.dart';
import 'package:text_recognitions/product/model/result.dart';

final class PostCacheManagerCubit extends Cubit<PinnedCacheManagerState> {
  PostCacheManagerCubit(this.cacheManager)
      : super(PinnedCacheManagerInitialState()) {
    fetchPosts();
  }
  final PinnedCacheManager cacheManager;

  Future<void> fetchPosts() async {
    try {
      await cacheManager.init();
      final posts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(posts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error fetching posts: $e'));
    }
  }

  Future<void> addPosts(Result posts) async {
    try {
      await cacheManager.putItems([posts]);
      final updatedPosts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedPosts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error adding posts: $e'));
    }
  }

  Future<void> deletePinned(String id) async {
    try {
      await cacheManager.removeItem(id);
      final updatedPosts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedPosts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error deleting posts: $e'));
    }
  }

  Future<void> updatePinned({
    required Result result,
    required Result deleteResult,
  }) async {
    try {
      await cacheManager.updateItem(result);
      await deletePinned(deleteResult.id ?? '');

      final updatedPosts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedPosts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error updating posts: $e'));
    }
  }
}
