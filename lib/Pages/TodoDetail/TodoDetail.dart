import 'package:flutter/material.dart';
import 'package:flutter_design/Pages/AddTaskPage/AddTaskPage.dart';
import 'package:flutter_design/Pages/TodoDetail/TodoList.dart';

class TodoDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoDetailState();
  }
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new Hero(
        tag: "add-action",
        child: new FloatingActionButton(
          onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return AddTaskPage();
              })),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
          backgroundColor: Color.fromRGBO(99, 138, 223, 1.0),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('My App Title'),
        backgroundColor: Colors.transparent,
        leading: new Icon(Icons.arrow_back, color: Colors.grey),
        elevation: 0.0,
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(
          horizontal: 45.0,
        ),
        margin: EdgeInsets.only(top: 90.0),
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 30.0),
              padding: EdgeInsets.all(0.0),
              child: new Hero(
                tag: "type_icon",
                child: new Container(
                    child: new CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                    ),
                    width: 45.0,
                    height: 45.0,
                    decoration: new BoxDecoration(
                      color: Colors.black, // border color
                      shape: BoxShape.circle,
                    )),
              ),
            ),
            new Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: new Align(
                    alignment: Alignment.bottomLeft,
                    child: new Hero(
                      tag: "task-number",
                      /* 用Material是正确的 ！！！ */
                      child: new Material(
                          color: Colors.transparent,
                          child: new Text(
                            "12 Tasks",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.grey),
                          )),
                    ))),
            new Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: new Align(
                    alignment: Alignment.bottomLeft,
                    child: new Hero(
                      tag: "task-title",
                      child: new Material(
                          color: Colors.transparent,
                          child: new Text(
                            " Works",
                            style: new TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          )),
                    ))),
            new TodoList("today"),
            new TodoList("today"),
          ],
        ),
      ),
    );
  }
}
