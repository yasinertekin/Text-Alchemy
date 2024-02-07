import 'package:flutter/material.dart';
import 'package:text_recognitions/product/core/cache/cache_manager.dart';
import 'package:text_recognitions/product/core/constants/hive_constants.dart';

@immutable

/// Represents a cache manager provider.
final class PinnedManager {
  const PinnedManager._();

  /// Creates a [PinnedCacheManager].
  static PinnedCacheManager createCacheManager() {
    return PinnedCacheManager(HiveConstants.hiveBoxName);
  }
}
