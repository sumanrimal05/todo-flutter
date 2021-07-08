import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/items.dart';

class TodoModel extends ChangeNotifier {
  // Item item;
  List<Item> _listItems = [];

  // List<Item> get items => _listItems;
  UnmodifiableListView<Item> get listItems => UnmodifiableListView(_listItems);

  void addItems(Item item) {
    _listItems.add(item);
    notifyListeners();
  }

  void removeAll() {
    _listItems.clear();
    notifyListeners();
  }

  void deleteSelected(index) {
    _listItems.removeWhere((_item) => _item.value == listItems[index].value);
    notifyListeners();
  }
}
