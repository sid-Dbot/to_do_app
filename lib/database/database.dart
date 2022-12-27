import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:to_do_app/database/DAO.dart';
import 'package:to_do_app/database/newModel.dart';

part 'database.g.dart';

@Database(version: 1, entities: [NewModel])
abstract class AppDatabase extends FloorDatabase {
  ItemDAO get itemDAO;
}
