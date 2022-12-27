import 'package:floor/floor.dart';
import 'package:to_do_app/database/newModel.dart';

@dao
abstract class ItemDAO {
  @Query('SELECT * FROM NewModel')
  Future<List<NewModel>> findallItems();

  @Query('SELECT * FROM NewModel')
  Stream<List<NewModel>> watchall();

  @insert
  Future<void> insertitem(NewModel newModel);

  @update
  Future<void> updateitem(NewModel newModel);

  @delete
  Future<int> deleteitem(NewModel newModel);
}
