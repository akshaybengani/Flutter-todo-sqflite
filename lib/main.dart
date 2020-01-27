import 'package:flutter/material.dart';
import 'package:fluttersqflite/addnotescreen.dart';
import 'package:fluttersqflite/databasehelper.dart';
import 'package:fluttersqflite/noteitem.dart';
import 'package:fluttersqflite/tododata.dart';
import 'package:fluttersqflite/todoprovider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: TodoProvider(),
          )
        ],
        child: MyHomeApp(),
      ),
      routes: {
        AddNotesScreen.routename: (ctx) => AddNotesScreen(),
      },
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoProvider>(context, listen: false);
    final todosList = todoData.todoList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'SqfLite CRUD',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text('Create', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pushNamed(AddNotesScreen.routename);
              },
              color: Colors.green,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: ListView.builder(
                itemCount: todosList.length,
                itemBuilder: (context, index) =>
                    NoteItem(todoData: todosList[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
