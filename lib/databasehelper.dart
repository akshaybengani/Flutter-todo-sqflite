import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:fluttersqflite/tododata.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String todoTable = 'todo_table';
  String colId = 'id';
  String colName = 'name';
  String colTodo = 'todo';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todo.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colTodo TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $todoTable');
    //var result = await db.query(todoTable);
    return result;
  }

  Future<int> insertTodo(TodoData todoData) async {
    Database db = await this.database;
    var result = await db.insert(todoTable, todoData.toMap());
    return result;
  }

  Future<int> updateTodo(TodoData todoData) async {
    Database db = await this.database;
    var result = await db.update(todoTable, todoData.toMap(),
        where: '$colId = ?', whereArgs: [todoData.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.database;
    var result =
        await db.rawDelete('DELETE FROM $todoTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.query('SELECT COUNT (*) FROM $todoTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<TodoData>> getTodoList() async {
    var todoMapList = await getNoteMapList();
    List<TodoData> todoList = List<TodoData>();
    int count = todoMapList.length;

    for (int i = 0; i < count; i++) {
      todoList.add(TodoData.fromMapObject(todoMapList[i]));
    }
    return todoList;
  }
}
