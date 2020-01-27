import 'package:flutter/material.dart';
import 'package:fluttersqflite/databasehelper.dart';
import 'package:fluttersqflite/tododata.dart';
import 'package:fluttersqflite/todoprovider.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {

  TodoData todoData;

  NoteItem({this.todoData});

  


  void _update(BuildContext context) {

    int result = await

  }

  void _delete(BuildContext context) async {
    
    int result = await Provider.of<TodoProvider>(context, listen: false).deleteTodo(todoData.id);

    if(result != 0){
      final snackbar = SnackBar(content: Text('Todo Deleted Successfully'),);
      Scaffold.of(context).showSnackBar(snackbar);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Name: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(todoData.name),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Todo: ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(todoData.todo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _update(context),
                  color: Colors.green,
                  child: Text(
                    'Update todo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                FlatButton(
                  color: Colors.white,
                  onPressed: () => _delete(context),
                  child: Text('Delete'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
