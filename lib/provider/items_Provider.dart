import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(
      id: 1,
      title: 'Laundry',
    ),
    Item(
      id: 2,
      title: 'Dishes',
    ),
    Item(
      id: 3,
      title: 'Post Mail',
    ),
  ];
  List<Item> get items {
    return [..._items];
  }
}
