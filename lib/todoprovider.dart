import 'package:flutter/cupertino.dart';
import 'package:fluttersqflite/databasehelper.dart';
import 'package:fluttersqflite/tododata.dart';

class TodoProvider with ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();
  
  List<TodoData> _todoList = [];

  List<TodoData> get todoList {
    return _todoList;
  }

  Future<int> deleteTodo(int id) async {
    int result = await databaseHelper.deleteTodo(id);
    _todoList.removeWhere((todo) => todo.id == id);
    notifyListeners();
    return result;
  }

  


  Future<void> insertTodo() async {}
}
