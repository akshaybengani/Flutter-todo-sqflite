import 'package:flutter/material.dart';

class AddNotesScreen extends StatelessWidget {
  static const routename = "/addnotesscreen";
  TextEditingController titleController = TextEditingController();
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Note'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                    labelText: 'Todo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
