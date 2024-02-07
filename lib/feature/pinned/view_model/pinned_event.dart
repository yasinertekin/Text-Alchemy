// Define the events that your Cubit will handle

import 'package:text_recognitions/product/model/result.dart';

abstract class PostCacheManagerEvent {}

final class FetchPostCacheManagerEvent extends PostCacheManagerEvent {}

final class AddPostItemsEvent extends PostCacheManagerEvent {
  AddPostItemsEvent(this.items);
  final List<Result> items;
}

final class PutPostItemsEvent extends PostCacheManagerEvent {
  PutPostItemsEvent(this.items);
  final List<Result> items;
}
