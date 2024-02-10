import 'package:flutter/material.dart';
import 'package:text_recognitions/product/core/cache/cache_manager.dart';
import 'package:text_recognitions/product/core/constants/hive_constants.dart';

@immutable

/// PinnedManager
final class PinnedManager {
  /// PinnedManager factory
  factory PinnedManager() {
    return const PinnedManager._();
  }
  const PinnedManager._();

  /// Create cache manager
  PinnedCacheManager createCacheManager() {
    return PinnedCacheManager(HiveConstants.hiveBoxName);
  }
}
