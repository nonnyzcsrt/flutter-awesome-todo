import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_todo/todo.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _text = '';
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Firestore db = Firestore.instance;

  _addTodoItem(String text) async {
    if (text.length > 0) {
      var data = new Map<String, dynamic>();
      data['title'] = text;
      data['isDone'] = false;
      db.collection('Todo').add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: TextField(
        autofocus: true,
        onSubmitted: (val) {
          _addTodoItem(val);
          Navigator.pop(context, Todo(val));
        },
//        style: TextStyle(fontSize:30.0,color: Color.black),
//        deco
      ),
    );
  }
}
