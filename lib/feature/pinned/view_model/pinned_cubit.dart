// Implement the Cubit

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_recognitions/feature/pinned/view_model/pinned_state.dart';
import 'package:text_recognitions/product/core/cache/cache_manager.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/model/result.dart';

/// TextRecognitionCacheManagerCubit is used to manage the cache of
/// the TextRecognitions
final class TextRecognitionCacheManagerCubit
    extends Cubit<PinnedCacheManagerState> {
  /// TextRecognitionCacheManagerCubit constructor
  TextRecognitionCacheManagerCubit(this.cacheManager)
      : super(PinnedCacheManagerInitialState()) {
    fetchTextRecognitions();
  }

  /// Cache manager
  final PinnedCacheManager cacheManager;

  /// Fetch TextRecognitions
  Future<void> fetchTextRecognitions() async {
    try {
      await cacheManager.init();
      final textRecognitions = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(textRecognitions));
    } catch (e) {
      emit(PinnedCacheManagerErrorState('Error fetching TextRecognitions: $e'));
    }
  }

  /// Add TextRecognitions
  Future<void> addTextRecognitions(Result textRecognitions) async {
    try {
      await cacheManager.putItems([textRecognitions]);
      final updatedTextRecognitions = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedTextRecognitions));
    } catch (e) {
      emit(
        PinnedCacheManagerErrorState(
          '${StringConstants.errorAddingTextRecognition}error: $e',
        ),
      );
    }
  }

  /// Delete TextRecognitions
  Future<void> deletePinned(String id) async {
    try {
      await cacheManager.removeItem(id);
      final updatedTextRecognitions = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedTextRecognitions));
    } catch (e) {
      emit(
        PinnedCacheManagerErrorState(
          '${StringConstants.errorDeletingTextRecognition}error: $e',
        ),
      );
    }
  }

  /// Update TextRecognitions
  Future<void> updatePinned({
    required Result result,
    required Result deleteResult,
  }) async {
    try {
      await cacheManager.updateItem(result);
      await deletePinned(deleteResult.id);

      final updatedTextRecognitions = cacheManager.getValues();
      emit(PinnedCacheManagerLoadedState(updatedTextRecognitions));
    } catch (e) {
      emit(
        PinnedCacheManagerErrorState(
          '${StringConstants.errorUpdatingTextRecognition}error: $e',
        ),
      );
    }
  }

  /// Delete all TextRecognitions
  Future<void> deleteAllPinned() async {
    try {
      await cacheManager.clearAll();
      emit(PinnedCacheManagerLoadedState([]));
    } catch (e) {
      emit(
        PinnedCacheManagerErrorState(
          '${StringConstants.errorFetchingTextRecognition}error: $e',
        ),
      );
    }
  }
}
