import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(
      id: 1,
      title: 'Laundry',
      added: DateTime.now(),
    ),
    Item(
      id: 2,
      title: 'Dishes',
      added: DateTime.now(),
    ),
    Item(
      id: 3,
      title: 'Post Mail',
      added: DateTime.now(),
    ),
  ];
  List<Item> get items {
    return [..._items];
  }

  postData(String taskname, DateTime date) {
    _items.add(Item(id: 4, title: taskname, added: date));
    notifyListeners();
  }
}
