import 'package:flutter/foundation.dart';

class ListPage<ItemType> {
  ListPage({
    @required this.totalCount,
    @required this.itemList,
    this.message,
  })  : assert(totalCount != null),
        assert(itemList != null);

  final int totalCount;
  final List<ItemType> itemList;
  final String message;

  bool isLastPage(int previouslyFetchedItemsCount) {
    final newItemsCount = itemList.length;
    final totalFetchedItemsCount = previouslyFetchedItemsCount + newItemsCount;
    return totalFetchedItemsCount == totalCount;
  }
}
