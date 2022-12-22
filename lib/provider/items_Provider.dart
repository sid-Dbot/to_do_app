import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(
      id: 1,
      title: 'Laundry',
      added: 'Dec 02,2022',
    ),
    Item(
      id: 2,
      title: 'Dishes',
      added: 'Dec 02,2022',
    ),
    Item(
      id: 3,
      title: 'Post Mail',
      added: 'Dec 02,2022',
    ),
  ];
  List<Item> get items {
    return [..._items];
  }

  postData(String name, String date) {
    _items.add(Item(id: 4, title: name, added: date));
    notifyListeners();
    print(_items);
  }
}
