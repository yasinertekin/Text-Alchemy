// Define the states for your Cubit

import 'package:text_recognitions/product/model/result.dart';

abstract class PinnedCacheManagerState {}

final class PinnedCacheManagerInitialState extends PinnedCacheManagerState {}

final class PinnedCacheManagerLoadedState extends PinnedCacheManagerState {
  PinnedCacheManagerLoadedState(this.result);
  final List<Result> result;
}

final class PinnedCacheManagerErrorState extends PinnedCacheManagerState {
  PinnedCacheManagerErrorState(this.error);
  final String error;
}
