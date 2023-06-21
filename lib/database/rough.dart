import 'package:hive/hive.dart';

class ToDoList {
  var list = Hive.box("todolist");
  var dummy = [];

  void initiateList() {
    // this method is executed when the app is opened for first time.
    dummy = [];
  }

  void fetchList() {
    dummy = list.get("data");
  }

  void updateList() {
    list.put("data", dummy);
  }
}
