// Define the states for your Cubit

import 'package:text_recognitions/product/model/result.dart';

/// PinnedCacheManagerState is used to manage the state
/// of the pinned cache manager
abstract final class PinnedCacheManagerState {}

/// PinnedCacheManagerInitialState is used to manage the initial state
final class PinnedCacheManagerInitialState extends PinnedCacheManagerState {}

/// PinnedCacheManagerLoadedState is used to manage the loaded state
final class PinnedCacheManagerLoadedState extends PinnedCacheManagerState {
  /// PinnedCacheManagerLoadedState constructor
  PinnedCacheManagerLoadedState(this.result);

  /// Result
  final List<Result> result;
}

/// PinnedCacheManagerErrorState is used to manage the error state
final class PinnedCacheManagerErrorState extends PinnedCacheManagerState {
  /// PinnedCacheManagerErrorState constructor
  PinnedCacheManagerErrorState(this.error);

  /// Error
  final String error;
}
