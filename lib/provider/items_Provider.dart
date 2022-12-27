import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/database/newModel.dart';
import 'package:to_do_app/repo/save_repo.dart';

import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  late SaveRepo savedRepo;

  List<NewModel> savedList = [];

  ItemProvider() {
    savedRepo = GetIt.instance.get<SaveRepo>();
    watchAll();
  }

  void watchAll() {
    savedRepo.watchALL().listen((savedList) {
      this.savedList = savedList;
      notifyListeners();
    });
  }

  Future<void> addTask(String name) async {
    var newSavedList = NewModel(name: name);
    await savedRepo.insertALl(newSavedList);
  }

  Future<void> update(String name, int id) async {
    var newSavedList = NewModel(name: name, id: id);
    await savedRepo.update(newSavedList);
  }

  Future<void> delete(NewModel newModel) async {
    await savedRepo.delete(newModel);
  }
}
