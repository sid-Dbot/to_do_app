import 'package:floor/floor.dart';

@entity
class NewModel {
  @primaryKey
  int? id;
  String? name;
  NewModel({this.id, required this.name});
}
