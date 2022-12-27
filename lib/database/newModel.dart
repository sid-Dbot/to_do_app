import 'package:floor/floor.dart';

@entity
class NewModel {
  @primaryKey
  int? id;
  String? name;
  String? date;
  NewModel({this.id, required this.name, required this.date});
}
