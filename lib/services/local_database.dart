import 'package:hive/hive.dart';

import '../models/item.dart';

class ItemDatabaseService {
  late Box<Item> _itemBox;

  Future<void> init() async {
    Hive.registerAdapter(ItemAdapter());
    _itemBox = await Hive.openBox<Item>('itemsBox');
  }

  // get lists of items
  Future<List<Item>> getItems() async {
    return _itemBox.values.toList();
  }

  // get item by id
  Future<Item?> getItemById(String id) async {
    return _itemBox.get(id);
  }

  // get items by category
  Future<List<Item>> getItemsByCategory(String category) async {
    return _itemBox.values.where((item) => item.category == category).toList();
  }

  // add item
  Future<void> addItem(Item item) async {
    await _itemBox.add(item);
  }

  // update item
  Future<void> updateItem(Item item) async {
    await _itemBox.put(item.id, item);
  }

  // delete item
  Future<void> deleteItem(String id) async {
    await _itemBox.delete(id);
  }

  // delete all items
  Future<void> deleteAllItems() async {
    await _itemBox.clear();
  }
}
