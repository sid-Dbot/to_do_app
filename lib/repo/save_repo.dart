import 'package:get_it/get_it.dart';
import 'package:to_do_app/database/DAO.dart';
import 'package:to_do_app/database/newModel.dart';

class SaveRepo {
  late ItemDAO itemDAO;

  savedrepo() {
    itemDAO = GetIt.instance.get<ItemDAO>();
  }

  Future<List<NewModel>> getALl() {
    return itemDAO.findallItems();
  }

  Future<void> insertALl(NewModel newModel) {
    return itemDAO.insertitem(newModel);
  }

  Future<void> update(NewModel newModel) {
    return itemDAO.updateitem(newModel);
  }

  Future<int> delete(NewModel newModel) {
    return itemDAO.deleteitem(newModel);
  }

  Stream<List<NewModel>> watchALL() {
    return itemDAO.watchall();
  }
}
