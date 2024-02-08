// Implement the Cubit

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/product/core/cache/cache_manager.dart';
import 'package:text_recognitions/product/model/result.dart';

/// PostCacheManagerCubit is used to manage the cache of the posts
final class PostCacheManagerCubit extends Cubit<PinnedCacheManagerState> {
  /// PostCacheManagerCubit constructor
  PostCacheManagerCubit(this.cacheManager)
      : super(PinnedCacheManagerInitialState()) {
    fetchPosts();
  }

  /// Cache manager
  final PinnedCacheManager cacheManager;

  /// Fetch posts
  Future<void> fetchPosts() async {
    try {
      await cacheManager.init();
      final posts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(posts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error fetching posts: $e'));
    }
  }

  /// Add posts
  Future<void> addPosts(Result posts) async {
    try {
      await cacheManager.putItems([posts]);
      final updatedPosts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedPosts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error adding posts: $e'));
    }
  }

  /// Delete posts
  Future<void> deletePinned(String id) async {
    try {
      await cacheManager.removeItem(id);
      final updatedPosts = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedPosts));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error deleting posts: $e'));
    }
  }

  /// Update posts
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

  /// Delete all posts
  Future<void> deleteAllPinned() async {
    try {
      await cacheManager.clearAll();
      emit(PinnedCacheManagerLoadedState([]));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error deleting all posts: $e'));
    }
  }
}
