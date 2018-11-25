import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_todo/detail/detail_page.dart';
import 'package:flutter_awesome_todo/todo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = List<Todo>();

  TextStyle _todoTextStyle(bool isDone) {
    if (isDone) {
      return TextStyle(fontSize: 30.0, decoration: TextDecoration.lineThrough);
    } else {
      return TextStyle(fontSize: 30.0);
    }
  }

  _pushToAddPage() async {
    Todo result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailPage();
    }));
    setState(() {
      todos.add(result);
    });
  }

//  _pushToDetailPage(Todo todo) async {
//    Todo result =
//    await Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return DetailPage(
//        todo: todo,
//      );
//    }));
//    setState((){});
//  }


  _buildRow(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Todo')
          .orderBy('isDone')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Todo> _todos = snapshot
        .map((documentSnapshot) => Todo.fromSnapshot(documentSnapshot))
        .toList();

    return ListView.builder(
         itemCount: _todos.length,
      itemBuilder: (BuildContext context,int index){
           return GestureDetector(
            child: De,
           );
      },
    );
  }


  @override
  void initState() {
    super.initState();
//    lists.add(Todo(title: "ios"));
//    lists.add(Todo(title: "web"));
//    lists.add(Todo(title: "andoird"));
//    lists.add(Todo(title: "backend"));
  }

  void _composeEmail() async {
    setState(() async {
      // lists.add(Listmodel(title: "aaaa"));
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(),
        ),
      );
      todos.add(Todo(title: result));
    });
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
        ,
      ),
      body: _buildRow(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _composeEmail,
        tooltip: 'Compose Email',
        child: Icon(Icons.add),
      ),
    );
  }
}
