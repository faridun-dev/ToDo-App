import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List toDoList = [];

  final _dataBox = Hive.box("dataBox");

  void createInitialData() {
    toDoList = [
      ["Make money", false],
      ["Make apps in Flutter", false],
    ];
  }

  void loadData() {
    toDoList = _dataBox.get("TODOLIST");
  }

  void updateDataBase() {
    _dataBox.put("TODOLIST", toDoList);
  }
}
